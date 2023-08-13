part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const welcome = _Paths.welcome;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const home = _Paths.home;
  static const updateInformation = _Paths.updateInformation;
  static const changePassword = _Paths.changePassword;
}

/// contains a list of route names.
class _Paths {
  static const welcome = '/welcome';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const updateInformation = '/updateInformation';
  static const changePassword = '/changePassword';
}
