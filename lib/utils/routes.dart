import 'package:get/get.dart';
import 'package:intern_test/src/view/features/login/screens/login_onboard_screen.dart';
import 'package:intern_test/src/view/features/login/screens/login_screen.dart';
import 'package:intern_test/src/view/features/register/screens/register_screen.dart';
import 'package:intern_test/src/view/features/splash/screens/splash_screen.dart';
import 'package:intern_test/src/view/features/todo/screens/todo_screen.dart';

class Routes {
  static const String splashScreen = "/";
  static const String loginOnboardScreen = "/onboard";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String todoScreen = "/todo";

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: loginOnboardScreen,
      page: () => const LoginOnboardScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: todoScreen,
      page: () => TodoScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
