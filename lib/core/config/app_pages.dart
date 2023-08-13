import 'package:get/get.dart';

import '../../features/change_password/view/change_password_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/register/view/register_screen.dart';
import '../../features/update_information/view/update_information_screen.dart';
import '../../features/welcome/view/welcome_screen.dart';
part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const welcome = Routes.welcome;
  static const login = Routes.login;
  static const register = Routes.register;
  static const home = Routes.home;
  static const updateInformation = Routes.updateInformation;
  static const changePassword = Routes.changePassword;

  static final routes = [
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.updateInformation,
      page: () => const UpdateInformationScreen(),
      binding: UpdateInformationBinding(),
    ),
    GetPage(
      name: _Paths.changePassword,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
