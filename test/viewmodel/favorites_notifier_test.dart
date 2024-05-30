import 'package:coffee_test_app/Core/Providers/coffee_providers.dart';
import 'package:coffee_test_app/Presentation/viewModel/favorites_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../usecases/mock_dependencies.dart';

void main() {
  late MockGetFavoriteImagesUseCase mockGetFavoriteImagesUseCase;
  late ProviderContainer container;
  late FavoritesNotifier favoritesNotifier;

  setUp(() {
    mockGetFavoriteImagesUseCase = MockGetFavoriteImagesUseCase();

    container = ProviderContainer(overrides: [
      getFavoriteImagesUseCaseProvider
          .overrideWithValue(mockGetFavoriteImagesUseCase),
    ]);

    favoritesNotifier = container.read(favoritesNotifierProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('Initial state is FavoritesInitial', () {
    expect(favoritesNotifier.state, isA<FavoritesInitial>());
  });

  test('loadFavorites emits FavoritesLoading and then FavoritesLoaded',
      () async {
    // Arrange
    final favoriteImages = ['image1.jpg', 'image2.jpg'];
    when(() => mockGetFavoriteImagesUseCase.execute())
        .thenAnswer((_) async => favoriteImages);

    // Act
    await favoritesNotifier.loadFavorites();

    // Assert
    expect(favoritesNotifier.state, isA<FavoritesLoaded>());
    expect((favoritesNotifier.state as FavoritesLoaded).favoriteImages,
        favoriteImages);
    verify(() => mockGetFavoriteImagesUseCase.execute()).called(1);
  });

  test(
      'loadFavorites emits FavoritesLoading and then FavoritesError on failure',
      () async {
    // Arrange
    const errorMessage = 'Failed to load favorites';
    when(() => mockGetFavoriteImagesUseCase.execute())
        .thenThrow(Exception(errorMessage));

    // Act
    await favoritesNotifier.loadFavorites();

    // Assert
    expect(favoritesNotifier.state, isA<FavoritesError>());
    expect((favoritesNotifier.state as FavoritesError).message, errorMessage);
    verify(() => mockGetFavoriteImagesUseCase.execute()).called(1);
  });
}
