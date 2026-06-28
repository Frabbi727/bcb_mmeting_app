import 'package:get/get.dart';
import '../../data/dao/user_dao.dart';
import 'home_controller.dart';
import 'home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Injects the HomeRepository implementing IHomeRepository (SOLID Principle)
    Get.lazyPut<IHomeRepository>(() => HomeRepositoryImpl(Get.find<UserDao>()));
    
    // Injects the HomeController
    Get.lazyPut<HomeController>(() => HomeController(Get.find<IHomeRepository>()));
  }
}
