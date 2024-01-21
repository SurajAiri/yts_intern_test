import 'package:get/get.dart';
import 'package:intern_test/src/view/features/login/screens/login_onboard_screen.dart';
import 'package:intern_test/src/view/features/login/screens/login_screen.dart';

class Routes {
  static const String loginOnboardScreen = "/onboard";
  static const String loginScreen = "/login";

  static List<GetPage> routes = [
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
  ];
}
