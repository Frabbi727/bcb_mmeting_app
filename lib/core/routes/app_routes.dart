part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const mainNav = _Paths.mainNav;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const login = '/login';
  static const mainNav = '/main_nav';
  static const home = '/home';
}
