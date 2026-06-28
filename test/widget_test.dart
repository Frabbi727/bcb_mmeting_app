import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:bcb_meeting_app/features/home/home_controller.dart';
import 'package:bcb_meeting_app/features/home/home_repository.dart';
import 'package:bcb_meeting_app/features/home/home_view.dart';
import 'package:bcb_meeting_app/data/models/user_model.dart';
import 'package:bcb_meeting_app/data/local/local_storage.dart';
import 'package:bcb_meeting_app/data/network/resource.dart';

class MockLocalStorageService extends GetxService implements LocalStorageService {
  @override
  Future<LocalStorageService> init() async {
    return this;
  }

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
  String? get accessToken => 'mock_token';

  @override
  Future<void> saveAccessToken(String token) async {}

  @override
  String? get refreshToken => 'mock_refresh';

  @override
  Future<void> saveRefreshToken(String token) async {}

  @override
  UserModel? get userInfo => null;

  @override
  Future<void> saveUserInfo(UserModel user) async {}

  @override
  Future<void> clearSession() async {}
}

class MockHomeRepository implements IHomeRepository {
  @override
  Future<Resource<UserModel>> fetchUserProfile(String userId) async {
    return ResourceSuccess(UserModel(
      id: '123',
      name: 'Test User',
      email: 'test@example.com',
    ));
  }
}

void main() {
  testWidgets('App launches and displays home title', (WidgetTester tester) async {
    // Inject Mock LocalStorageService
    Get.put<LocalStorageService>(MockLocalStorageService());

    // Inject mock repository and controller in isolation
    final mockRepo = MockHomeRepository();
    Get.put<IHomeRepository>(mockRepo);
    Get.put(HomeController(mockRepo));

    // Build our view and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: HomeView(),
    ));
    await tester.pump();

    // Verify that the home view renders with the correct title.
    expect(find.text('BCB Base Project'), findsOneWidget);
    
    // Clean up Get instances
    Get.reset();
  });
}
