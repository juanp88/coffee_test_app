import 'package:coffee_test_app/utils/constants.dart';

import '../../Domain/repository/coffee_remote_repository.dart';
import '../remote/api_service.dart';

class CoffeeRemoteRepositoryImpl implements CoffeeRemoteRepository {
  final ApiService apiService;

  CoffeeRemoteRepositoryImpl(this.apiService);

  @override
  Future<String> fetchCoffeeImage() async {
    final response = await apiService.request(endpoint: Constants.endpoint);
    return response['file'];
  }
}
