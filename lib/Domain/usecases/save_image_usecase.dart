import '../repository/coffee_local_repository.dart';

class SaveImageUseCase {
  final CoffeeLocalRepository coffeeRepository;

  SaveImageUseCase(this.coffeeRepository);

  Future<void> execute(String url) async {
    await coffeeRepository.saveImage(url);
  }
}
