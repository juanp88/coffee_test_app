import 'package:coffee_test_app/Data/remote/api_service.dart';
import 'package:coffee_test_app/Data/repositories/coffee_remote_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late MockApiService mockApiService;
  late CoffeeRemoteRepositoryImpl coffeeRemoteRepository;

  setUp(() {
    mockApiService = MockApiService();
    coffeeRemoteRepository = CoffeeRemoteRepositoryImpl(mockApiService);
  });

  test('should fetch coffee image from API service', () async {
    const imageUrl = 'https://coffee.alexflipnote.dev/sample.jpg';
    when(() => mockApiService.request(endpoint: '/random.json'))
        .thenAnswer((_) async => {'file': imageUrl});

    final result = await coffeeRemoteRepository.fetchCoffeeImage();

    expect(result, imageUrl);
    verify(() => mockApiService.request(endpoint: '/random.json')).called(1);
  });
}
