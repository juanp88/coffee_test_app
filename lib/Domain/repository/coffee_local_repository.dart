abstract class CoffeeLocalRepository {
  Future<void> saveImage(String url);
  Future<List<String>> getFavoriteImages();
}
