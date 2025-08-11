import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Core/Providers/coffee_providers.dart';
import '../../Domain/usecases/fetch_image_usecase.dart';
import '../../Domain/usecases/save_image_usecase.dart';

part 'coffee_notifier.g.dart';

@Riverpod(keepAlive: true)
class CoffeeNotifier extends _$CoffeeNotifier {
  late final FetchCoffeeImageUseCase fetchCoffeeImageUseCase;
  late final SaveImageUseCase saveImageUseCase;
  late final Connectivity connectivity;
  String? lastImageUrl;

  @override
  CoffeeState build() {
    fetchCoffeeImageUseCase = ref.watch(fetchCoffeeImageUseCaseProvider);
    saveImageUseCase = ref.watch(saveImageUseCaseProvider);
    connectivity = ref.watch(connectivityProvider);
    return CoffeeInitial();
  }

  Future<void> fetchCoffeeImage() async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        state = CoffeeError(
            'No internet connection. Please check your connection and try again.');
      } else {
        state = CoffeeLoading();
        final imageUrl = await fetchCoffeeImageUseCase.execute();
        lastImageUrl = imageUrl;
        state = CoffeeLoaded(imageUrl);
      }
    } catch (e) {
      state = CoffeeError(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<void> saveImage(String url) async {
    await saveImageUseCase.execute(url);
  }
}

abstract class CoffeeState {}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final String imageUrl;
  CoffeeLoaded(this.imageUrl);
}

class CoffeeError extends CoffeeState {
  final String message;
  CoffeeError(this.message);
}

class MockCoffeeNotifier extends _$CoffeeNotifier
    with Mock
    implements CoffeeNotifier {
  @override
  CoffeeState build() => CoffeeLoaded('https://coffee.alexflipnote.dev/random');
}
