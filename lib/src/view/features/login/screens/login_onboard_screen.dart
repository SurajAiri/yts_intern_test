import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/view/widgets/action_button.dart';
import 'package:intern_test/utils/assets_path.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:intern_test/utils/routes.dart';

class LoginOnboardScreen extends StatelessWidget {
  const LoginOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  apLogoPath,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 50),
                Image.asset(
                  apOnboardBgPath,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                const SizedBox(height: 40),
                const Text(
                  "Welcome to YoursThatSenior",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "Join our community to get mentorship for everything. One step solution for all your interest.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 25),
                ActionButton(
                  title: "Register",
                  onPressed: () {
                    Get.toNamed(Routes.registerScreen);
                  },
                ),
                const SizedBox(height: 15),
                ActionButton(
                  backgroundColor: Colors.black54,
                  title: "Log in",
                  onPressed: () {
                    Get.toNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
