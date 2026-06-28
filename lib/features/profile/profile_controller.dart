import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_pages.dart';
import '../../data/local/local_storage.dart';
import '../../data/models/user_model.dart';
import 'profile_repository.dart';

class ProfileController extends GetxController {
  final IProfileRepository _repository;
  final LocalStorageService _storage = Get.find<LocalStorageService>();

  ProfileController(this._repository);

  final Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    user.value = _storage.userInfo;
  }

  // Central Theme Switcher
  void toggleTheme() {
    final isDark = Get.isDarkMode;
    final targetMode = isDark ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(targetMode);
    _storage.saveThemeMode(isDark ? 'light' : 'dark');
  }

  // Central Language Locale Switcher
  void changeLanguage(String langCode, String? countryCode) {
    final locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
    _storage.saveLocale(langCode, countryCode);
  }

  Future<void> logout() async {
    await _repository.logout();
    Get.offAllNamed(Routes.login);
  }
}
