import 'package:coffee_test_app/Core/Providers/coffee_providers.dart';
import 'package:coffee_test_app/Presentation/viewModel/coffee_notifier.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../usecases/mock_dependencies.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel connectivityChannel =
      MethodChannel('dev.fluttercommunity.plus/connectivity');

  setUpAll(() {
    registerFallbackValue(FakeBuildContext());

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(connectivityChannel,
            (MethodCall methodCall) async {
      if (methodCall.method == 'check') {
        return 'wifi'; // You can change this to 'none' or 'mobile' as needed
      }
      return null;
    });
  });

  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(connectivityChannel, null);
  });

  late MockFetchCoffeeImageUseCase mockFetchCoffeeImageUseCase;
  late MockSaveImageUseCase mockSaveImageUseCase;
  late ProviderContainer container;
  late CoffeeNotifier coffeeNotifier;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockFetchCoffeeImageUseCase = MockFetchCoffeeImageUseCase();
    mockSaveImageUseCase = MockSaveImageUseCase();
    mockConnectivity = MockConnectivity();

    container = ProviderContainer(overrides: [
      fetchCoffeeImageUseCaseProvider
          .overrideWithValue(mockFetchCoffeeImageUseCase),
      saveImageUseCaseProvider.overrideWithValue(mockSaveImageUseCase),
      connectivityProvider.overrideWithValue(mockConnectivity),
    ]);

    coffeeNotifier = container.read(coffeeNotifierProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('Initial state is CoffeeInitial', () {
    expect(coffeeNotifier.state, isA<CoffeeInitial>());
  });

  test('fetchCoffeeImage emits CoffeeLoading and then CoffeeLoaded', () async {
    // Arrange
    const imageUrl = 'https://coffee.alexflipnote.dev/random';
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);
    when(() => mockFetchCoffeeImageUseCase.execute())
        .thenAnswer((_) async => imageUrl);

    // Act
    await coffeeNotifier.fetchCoffeeImage(FakeBuildContext());

    // Assert
    expect(coffeeNotifier.state, isA<CoffeeLoaded>());
    expect((coffeeNotifier.state as CoffeeLoaded).imageUrl, imageUrl);
    verify(() => mockFetchCoffeeImageUseCase.execute()).called(1);
  });

  test('fetchCoffeeImage emits CoffeeLoading and then CoffeeError on failure',
      () async {
    // Arrange
    const errorMessage = 'Failed to load data';
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);
    when(() => mockFetchCoffeeImageUseCase.execute())
        .thenThrow(Exception(errorMessage));

    // Act
    await coffeeNotifier.fetchCoffeeImage(FakeBuildContext());

    // Assert
    expect(coffeeNotifier.state, isA<CoffeeError>());
    expect((coffeeNotifier.state as CoffeeError).message, errorMessage);
    verify(() => mockFetchCoffeeImageUseCase.execute()).called(1);
  });

  test('fetchCoffeeImage shows SnackBar when no connectivity', () async {
    // Arrange
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => Future.value([ConnectivityResult.none]));

    // Act
    await coffeeNotifier.fetchCoffeeImage(FakeBuildContext());

    // Assert
    expect(coffeeNotifier.state, isA<CoffeeError>());
  });

  test('saveImage calls SaveImageUseCase.execute', () async {
    // Arrange
    const imageUrl = 'https://coffee.alexflipnote.dev/random';
    when(() => mockSaveImageUseCase.execute(imageUrl)).thenAnswer((_) async {});

    // Act
    await coffeeNotifier.saveImage(imageUrl);

    // Assert
    verify(() => mockSaveImageUseCase.execute(imageUrl)).called(1);
  });
}
