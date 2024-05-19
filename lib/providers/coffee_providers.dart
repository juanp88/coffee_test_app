import 'package:coffee_test_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/local/local_storage_service.dart';
import '../Data/remote/api_service.dart';
import '../Data/repositories/coffee_local_repository_impl.dart';
import '../Data/repositories/coffee_remote_repository_impl.dart';
import '../Domain/repository/coffee_local_repository.dart';
import '../Domain/repository/coffee_remote_repository.dart';
import '../Domain/usecases/fetch_image_usecase.dart';
import '../Domain/usecases/get_favorite_images_usecase.dart';
import '../Domain/usecases/save_image_usecase.dart';
import 'package:http/http.dart' as http;

// ApiService Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(
    baseUrl: Constants.baseUrl,
    httpClient: http.Client(),
  );
});

// LocalStorageService Provider
final localStorageServiceProvider =
    Provider<LocalStorageService>((ref) => LocalStorageService());

// CoffeeRemoteRepository Provider
final coffeeRemoteRepositoryProvider = Provider<CoffeeRemoteRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CoffeeRemoteRepositoryImpl(apiService);
});

// CoffeeLocalRepository Provider
final coffeeLocalRepositoryProvider = Provider<CoffeeLocalRepository>((ref) {
  final localStorageService = ref.watch(localStorageServiceProvider);
  return CoffeeLocalRepositoryImpl(localStorageService);
});

// Use Cases Providers
final fetchCoffeeImageUseCaseProvider =
    Provider<FetchCoffeeImageUseCase>((ref) {
  final coffeeRemoteRepository = ref.watch(coffeeRemoteRepositoryProvider);
  return FetchCoffeeImageUseCase(coffeeRemoteRepository);
});

final saveImageUseCaseProvider = Provider<SaveImageUseCase>((ref) {
  final coffeeLocalRepository = ref.watch(coffeeLocalRepositoryProvider);
  return SaveImageUseCase(coffeeLocalRepository);
});

final getFavoriteImagesUseCaseProvider =
    Provider<GetFavoriteImagesUseCase>((ref) {
  final coffeeLocalRepository = ref.watch(coffeeLocalRepositoryProvider);
  return GetFavoriteImagesUseCase(coffeeLocalRepository);
});
