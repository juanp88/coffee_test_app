import 'package:coffee_test_app/Data/local/local_storage_service.dart';
import 'package:coffee_test_app/Data/repositories/coffee_local_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

void main() {
  late MockLocalStorageService mockLocalStorageService;
  late CoffeeLocalRepositoryImpl coffeeLocalRepository;

  setUp(() {
    mockLocalStorageService = MockLocalStorageService();
    coffeeLocalRepository = CoffeeLocalRepositoryImpl(mockLocalStorageService);
  });

  test('should save image locally', () async {
    const imageUrl = 'https://coffee.alexflipnote.dev/sample.jpg';
    when(() => mockLocalStorageService.saveImage(imageUrl))
        .thenAnswer((_) async => {});

    await coffeeLocalRepository.saveImage(imageUrl);

    verify(() => mockLocalStorageService.saveImage(imageUrl)).called(1);
  });

  test('should retrieve favorite images from local storage', () async {
    final favoriteImages = ['path/to/image1.jpg', 'path/to/image2.jpg'];
    when(() => mockLocalStorageService.getFavoriteImages())
        .thenAnswer((_) async => favoriteImages);

    final result = await coffeeLocalRepository.getFavoriteImages();

    expect(result, favoriteImages);
    verify(() => mockLocalStorageService.getFavoriteImages()).called(1);
  });
}
