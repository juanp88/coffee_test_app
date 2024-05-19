import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Domain/usecases/fetch_image_usecase.dart';
import '../../Domain/usecases/get_favorite_images_usecase.dart';
import '../../Domain/usecases/save_image_usecase.dart';
import '../../providers/coffee_providers.dart';

part 'coffee_notifier.g.dart';

@Riverpod(keepAlive: true)
class CoffeeNotifier extends _$CoffeeNotifier {
  late final FetchCoffeeImageUseCase fetchCoffeeImageUseCase;
  late final SaveImageUseCase saveImageUseCase;
  late final GetFavoriteImagesUseCase getFavoriteImagesUseCase;
  String? lastImageUrl;

  @override
  CoffeeState build() {
    fetchCoffeeImageUseCase = ref.watch(fetchCoffeeImageUseCaseProvider);
    saveImageUseCase = ref.watch(saveImageUseCaseProvider);
    getFavoriteImagesUseCase = ref.watch(getFavoriteImagesUseCaseProvider);
    return CoffeeInitial();
  }

  Future<void> fetchCoffeeImage(BuildContext context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'No internet connection. Please check your connection and try again.')),
      );
    } else {
      try {
        state = CoffeeLoading();
        final imageUrl = await fetchCoffeeImageUseCase.execute();
        lastImageUrl = imageUrl;
        state = CoffeeLoaded(imageUrl);
      } catch (e) {
        state = CoffeeError(e.toString().replaceFirst('Exception: ', ''));
      }
    }
  }

  Future<void> saveImage(String url) async {
    await saveImageUseCase.execute(url);
  }

  Future<void> loadFavorites() async {
    final favorites = await getFavoriteImagesUseCase.execute();
    state = FavoritesLoaded(favorites);
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }
}

abstract class CoffeeState {}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final String imageUrl;
  CoffeeLoaded(this.imageUrl);
}

class CoffeeError extends CoffeeState {
  final String message;
  CoffeeError(this.message);
}

class FavoritesLoaded extends CoffeeState {
  final List<String> favoriteImages;
  FavoritesLoaded(this.favoriteImages);
}
