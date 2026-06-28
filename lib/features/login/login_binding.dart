import 'package:get/get.dart';
import '../../data/dao/user_dao.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginRepository>(() => LoginRepositoryImpl(Get.find<UserDao>()));
    Get.lazyPut(() => LoginController(Get.find<ILoginRepository>()));
  }
}
