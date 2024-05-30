import 'package:coffee_test_app/Presentation/new_image_screen.dart';
import 'package:coffee_test_app/Presentation/viewModel/coffee_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeBuildContext extends Fake implements BuildContext {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
  });

  setUp(() {
    registerFallbackValue(MockCoffeeNotifier());
  });

  testWidgets('Find the load new image button by key',
      (WidgetTester tester) async {
    // Arrange
    final container = ProviderContainer(
      overrides: [
        coffeeNotifierProvider.overrideWith(() => MockCoffeeNotifier()),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: NewImageScreen(),
        ),
      ),
    );

    // Assert
    expect(find.byKey(const Key('Btn_load_new_image')), findsOneWidget);
  });

  testWidgets('Find the save to favorites button by key',
      (WidgetTester tester) async {
    // Arrange
    final container = ProviderContainer(
      overrides: [
        coffeeNotifierProvider.overrideWith(() => MockCoffeeNotifier()),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: NewImageScreen(),
        ),
      ),
    );

    // Assert
    expect(find.byKey(const Key('Btn_save_to_favorites')), findsOneWidget);
  });

  testWidgets('Test interaction with load new image button',
      (WidgetTester tester) async {
    // Arrange
    final mockNotifier = MockCoffeeNotifier();
    when(() => mockNotifier.fetchCoffeeImage(any())).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [
        coffeeNotifierProvider.overrideWith(() => mockNotifier),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: NewImageScreen(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byKey(const Key('Btn_load_new_image')));
    await tester.pump();

    // Assert
    verify(() => mockNotifier.fetchCoffeeImage(any())).called(1);
  });

  testWidgets('Test save to favorites button is clickable',
      (WidgetTester tester) async {
    // Arrange
    const imageUrl = 'https://coffee.alexflipnote.dev/random';
    final mockNotifier = MockCoffeeNotifier();
    when(() => mockNotifier.saveImage(imageUrl)).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [
        coffeeNotifierProvider.overrideWith(() => mockNotifier),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: NewImageScreen(),
        ),
      ),
    );

    // Act
    final saveButton = find.byKey(const Key('Btn_save_to_favorites'));

    // Assert
    expect(saveButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(saveButton).enabled, true);

    // Trigger the button tap
    await tester.tap(saveButton);
    await tester.pump();

    // Verify the interaction
    verify(() => mockNotifier.saveImage(imageUrl)).called(1);
  });
}
