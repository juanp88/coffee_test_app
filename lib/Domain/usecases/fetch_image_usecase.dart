import '../repository/coffee_remote_repository.dart';

class FetchCoffeeImageUseCase {
  final CoffeeRemoteRepository coffeeRepository;

  FetchCoffeeImageUseCase(this.coffeeRepository);

  Future<String> execute() async {
    return await coffeeRepository.fetchCoffeeImage();
  }
}
