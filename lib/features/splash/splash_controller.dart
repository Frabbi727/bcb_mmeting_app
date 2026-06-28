import 'package:get/get.dart';
import '../../core/routes/app_pages.dart';
import '../../data/local/local_storage.dart';

class SplashController extends GetxController {
  final LocalStorageService _storage = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    _startSessionCheck();
  }

  void _startSessionCheck() async {
    await Future.delayed(const Duration(seconds: 2));
    
    final token = _storage.accessToken;
    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(Routes.mainNav);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
