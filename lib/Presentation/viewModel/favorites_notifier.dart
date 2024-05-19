import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Core/Providers/coffee_providers.dart';
import '../../Domain/usecases/get_favorite_images_usecase.dart';

part 'favorites_notifier.g.dart';

@Riverpod(keepAlive: true)
class FavoritesNotifier extends _$FavoritesNotifier {
  late final GetFavoriteImagesUseCase getFavoriteImagesUseCase;

  @override
  FavoritesState build() {
    getFavoriteImagesUseCase = ref.watch(getFavoriteImagesUseCaseProvider);
    return FavoritesInitial();
  }

  Future<void> loadFavorites() async {
    state = FavoritesLoading();
    try {
      final favorites = await getFavoriteImagesUseCase.execute();
      state = FavoritesLoaded(favorites);
    } catch (e) {
      state = FavoritesError(e.toString().replaceFirst('Exception: ', ''));
    }
  }
}

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<String> favoriteImages;
  FavoritesLoaded(this.favoriteImages);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}
