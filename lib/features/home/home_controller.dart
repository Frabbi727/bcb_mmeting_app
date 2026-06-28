import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local/local_storage.dart';
import '../../data/models/user_model.dart';
import '../../data/network/resource.dart';
import 'home_repository.dart';

class HomeController extends GetxController {
  final IHomeRepository _repository;
  final LocalStorageService _storage = Get.find<LocalStorageService>();

  HomeController(this._repository);

  final RxBool isLoading = false.obs;
  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile("123");
  }

  Future<void> fetchUserProfile(String userId) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    final resource = await _repository.fetchUserProfile(userId);
    
    switch (resource) {
      case ResourceSuccess(data: final userData):
        user.value = userData;
        errorMessage.value = '';
      case ResourceError(errorMessage: final message):
        user.value = null;
        errorMessage.value = message;
      case ResourceLoading():
        break;
    }
    
    isLoading.value = false;
  }

  // Central Theme Switcher
  void toggleTheme() {
    final isDark = Get.isDarkMode;
    final targetMode = isDark ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(targetMode);
    _storage.saveThemeMode(isDark ? 'light' : 'dark');
  }

  // Central Language/Locale Switcher
  void changeLanguage(String langCode, String? countryCode) {
    final locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
    _storage.saveLocale(langCode, countryCode);
  }
}
