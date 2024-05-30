import 'package:coffee_test_app/Domain/usecases/fetch_image_usecase.dart';
import 'package:coffee_test_app/Domain/usecases/get_favorite_images_usecase.dart';
import 'package:coffee_test_app/Domain/usecases/save_image_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchCoffeeImageUseCase extends Mock
    implements FetchCoffeeImageUseCase {}

class MockSaveImageUseCase extends Mock implements SaveImageUseCase {}

class MockGetFavoriteImagesUseCase extends Mock
    implements GetFavoriteImagesUseCase {}

class MockConnectivity extends Mock implements Connectivity {}

class FakeBuildContext extends Fake implements BuildContext {}
