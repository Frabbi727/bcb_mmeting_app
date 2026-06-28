import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:bcb_meeting_app/features/splash/splash_view.dart';
import 'package:bcb_meeting_app/features/splash/splash_controller.dart';
import 'package:bcb_meeting_app/data/local/local_storage.dart';
import 'package:bcb_meeting_app/data/models/user_model.dart';

class MockLocalStorageService extends GetxService implements LocalStorageService {
  @override
  Future<LocalStorageService> init() async => this;
  
  @override
  String get themeMode => 'light';
  
  @override
  Future<void> saveThemeMode(String mode) async {}

  @override
  String? get languageCode => 'en';

  @override
  String? get countryCode => 'US';

  @override
  Future<void> saveLocale(String lang, String? country) async {}

  @override
  String? get accessToken => null;

  @override
  Future<void> saveAccessToken(String token) async {}

  @override
  String? get refreshToken => null;

  @override
  Future<void> saveRefreshToken(String token) async {}

  @override
  UserModel? get userInfo => null;

  @override
  Future<void> saveUserInfo(UserModel user) async {}

  @override
  Future<void> clearSession() async {}
}

void main() {
  testWidgets('SplashView displays title and navigates', (WidgetTester tester) async {
    // Inject Mock LocalStorageService
    Get.put<LocalStorageService>(MockLocalStorageService());
    
    // Inject SplashController
    Get.put(SplashController());

    // Build the SplashView with routes registered.
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashView()),
        GetPage(name: '/login', page: () => const Scaffold(body: Text('Login Page'))),
      ],
    ));

    // Verify that the splash view displays the app title
    expect(find.text('BCB Meeting App'), findsOneWidget);
    
    // Pump the timer forward by 3 seconds to complete the delayed routing task
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify that we successfully navigated to the Login Page
    expect(find.text('Login Page'), findsOneWidget);

    // Clean up Get instances
    Get.reset();
  });
}
