import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/values/constants.dart';
import '../models/user_model.dart';

class LocalStorageService extends GetxService {
  late final GetStorage _box;

  Future<LocalStorageService> init() async {
    _box = GetStorage();
    return this;
  }

  // Tokens
  String? get accessToken => _box.read<String>(AppConstants.keyToken);
  
  Future<void> saveAccessToken(String token) async {
    await _box.write(AppConstants.keyToken, token);
  }

  String? get refreshToken => _box.read<String>(AppConstants.keyRefreshToken);

  Future<void> saveRefreshToken(String token) async {
    await _box.write(AppConstants.keyRefreshToken, token);
  }

  // User Info
  UserModel? get userInfo {
    final rawJson = _box.read<String>(AppConstants.keyUserInfo);
    if (rawJson == null) return null;
    try {
      final map = jsonDecode(rawJson) as Map<String, dynamic>;
      return UserModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveUserInfo(UserModel user) async {
    final rawJson = jsonEncode(user.toJson());
    await _box.write(AppConstants.keyUserInfo, rawJson);
  }

  // Clear session data
  Future<void> clearSession() async {
    await _box.remove(AppConstants.keyToken);
    await _box.remove(AppConstants.keyRefreshToken);
    await _box.remove(AppConstants.keyUserInfo);
  }

  // Theme Mode
  String get themeMode => _box.read<String>(AppConstants.keyThemeMode) ?? 'system';

  Future<void> saveThemeMode(String mode) async {
    await _box.write(AppConstants.keyThemeMode, mode);
  }

  // Language/Locale Settings
  String? get languageCode => _box.read<String>(AppConstants.keyLanguageCode);
  String? get countryCode => _box.read<String>(AppConstants.keyCountryCode);

  Future<void> saveLocale(String lang, String? country) async {
    await _box.write(AppConstants.keyLanguageCode, lang);
    if (country != null) {
      await _box.write(AppConstants.keyCountryCode, country);
    } else {
      await _box.remove(AppConstants.keyCountryCode);
    }
  }
}
