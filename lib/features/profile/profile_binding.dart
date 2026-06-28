import 'package:get/get.dart';
import 'profile_controller.dart';
import 'profile_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileRepository>(() => ProfileRepositoryImpl());
    Get.lazyPut(() => ProfileController(Get.find<IProfileRepository>()));
  }
}
