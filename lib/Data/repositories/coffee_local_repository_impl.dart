import '../../Domain/repository/coffee_local_repository.dart';
import '../local/local_storage_service.dart';

class CoffeeLocalRepositoryImpl implements CoffeeLocalRepository {
  final LocalStorageService localStorageService;

  CoffeeLocalRepositoryImpl(this.localStorageService);

  @override
  Future<void> saveImage(String url) async {
    await localStorageService.saveImage(url);
  }

  @override
  Future<List<String>> getFavoriteImages() async {
    return await localStorageService.getFavoriteImages();
  }
}
