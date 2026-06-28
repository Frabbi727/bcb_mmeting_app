import 'package:get/get.dart';
import '../../features/home/home_binding.dart';
import '../../features/home/home_view.dart';
import '../../features/login/login_binding.dart';
import '../../features/login/login_view.dart';
import '../../features/main_nav/main_nav_binding.dart';
import '../../features/main_nav/main_nav_view.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.mainNav,
      page: () => const MainNavView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
