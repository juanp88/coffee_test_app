// import 'package:coffee_test_app/Domain/usecases/fetch_image_usecase.dart';
// import 'package:coffee_test_app/Domain/usecases/get_favorite_images_usecase.dart';
// import 'package:coffee_test_app/Domain/usecases/save_image_usecase.dart';
// import 'package:coffee_test_app/Presentation/viewModel/coffee_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockFetchCoffeeImageUseCase extends Mock
//     implements FetchCoffeeImageUseCase {}

// class MockSaveImageUseCase extends Mock implements SaveImageUseCase {}

// class MockGetFavoriteImagesUseCase extends Mock
//     implements GetFavoriteImagesUseCase {}

// class MockBuildContext extends Mock implements BuildContext {}

// class MockFetchCoffeeImageUseCase extends Mock
//     implements FetchCoffeeImageUseCase {}

// class MockSaveImageUseCase extends Mock implements SaveImageUseCase {}

// class MockGetFavoriteImagesUseCase extends Mock
//     implements GetFavoriteImagesUseCase {}

// // Mock class for BuildContext
// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
//   late MockFetchCoffeeImageUseCase mockFetchCoffeeImageUseCase;
//   late MockSaveImageUseCase mockSaveImageUseCase;
//   late MockGetFavoriteImagesUseCase mockGetFavoriteImagesUseCase;
//   late CoffeeNotifier coffeeNotifier;

//   setUp(() {
//     mockFetchCoffeeImageUseCase = MockFetchCoffeeImageUseCase();
//     mockSaveImageUseCase = MockSaveImageUseCase();
//     mockGetFavoriteImagesUseCase = MockGetFavoriteImagesUseCase();

//     // Mock the loadFavorites method to avoid unexpected calls during initialization
//     when(() => mockGetFavoriteImagesUseCase.execute())
//         .thenAnswer((_) async => <String>[]);
//   });

//   //TODO TESTS FOR THE NOTIFIER (VIEWMODEL)
// }
