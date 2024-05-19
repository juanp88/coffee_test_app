import 'package:coffee_test_app/Domain/repository/coffee_local_repository.dart';
import 'package:coffee_test_app/Domain/repository/coffee_remote_repository.dart';
import 'package:coffee_test_app/Domain/usecases/fetch_image_usecase.dart';
import 'package:coffee_test_app/Domain/usecases/get_favorite_images_usecase.dart';
import 'package:coffee_test_app/Domain/usecases/save_image_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeeRemoteRepository extends Mock
    implements CoffeeRemoteRepository {}

class MockCoffeeLocalRepository extends Mock implements CoffeeLocalRepository {}

void main() {
  late MockCoffeeRemoteRepository mockCoffeeRemoteRepository;
  late MockCoffeeLocalRepository mockCoffeeLocalRepository;
  late FetchCoffeeImageUseCase fetchCoffeeImageUseCase;
  late SaveImageUseCase saveImageUseCase;
  late GetFavoriteImagesUseCase getFavoriteImagesUseCase;

  setUp(() {
    mockCoffeeRemoteRepository = MockCoffeeRemoteRepository();
    mockCoffeeLocalRepository = MockCoffeeLocalRepository();
    fetchCoffeeImageUseCase =
        FetchCoffeeImageUseCase(mockCoffeeRemoteRepository);
    saveImageUseCase = SaveImageUseCase(mockCoffeeLocalRepository);
    getFavoriteImagesUseCase =
        GetFavoriteImagesUseCase(mockCoffeeLocalRepository);
  });

  test('should fetch coffee image from repository', () async {
    const imageUrl = 'https://coffee.alexflipnote.dev/sample.jpg';
    when(() => mockCoffeeRemoteRepository.fetchCoffeeImage())
        .thenAnswer((_) async => imageUrl);

    final result = await fetchCoffeeImageUseCase.execute();

    expect(result, imageUrl);
    verify(() => mockCoffeeRemoteRepository.fetchCoffeeImage()).called(1);
  });

  test('should save image using repository', () async {
    const imageUrl = 'https://coffee.alexflipnote.dev/sample.jpg';
    when(() => mockCoffeeLocalRepository.saveImage(imageUrl))
        .thenAnswer((_) async => {});

    await saveImageUseCase.execute(imageUrl);

    verify(() => mockCoffeeLocalRepository.saveImage(imageUrl)).called(1);
  });

  test('should get favorite images from repository', () async {
    final favoriteImages = ['path/to/image1.jpg', 'path/to/image2.jpg'];
    when(() => mockCoffeeLocalRepository.getFavoriteImages())
        .thenAnswer((_) async => favoriteImages);

    final result = await getFavoriteImagesUseCase.execute();

    expect(result, favoriteImages);
    verify(() => mockCoffeeLocalRepository.getFavoriteImages()).called(1);
  });
}
