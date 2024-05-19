import '../repository/coffee_local_repository.dart';

class GetFavoriteImagesUseCase {
  final CoffeeLocalRepository coffeeRepository;

  GetFavoriteImagesUseCase(this.coffeeRepository);

  Future<List<String>> execute() async {
    return await coffeeRepository.getFavoriteImages();
  }
}
