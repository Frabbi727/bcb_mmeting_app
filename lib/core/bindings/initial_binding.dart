import 'package:get/get.dart';
import '../../data/network/api_client.dart';
import '../../data/dao/user_dao.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // LocalStorageService is pre-initialized in main() and put in Get.
    // Inject ApiClient which references LocalStorageService
    Get.lazyPut<ApiClient>(() => ApiClient(), fenix: true);

    // Inject DAOs globally
    Get.lazyPut<UserDao>(() => UserDao(Get.find<ApiClient>().dio), fenix: true);
  }
}
