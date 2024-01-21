import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/login_controller.dart';
import 'package:intern_test/src/view/widgets/action_button.dart';
import 'package:intern_test/src/view/widgets/blank_appbar.dart';
import 'package:intern_test/src/view/widgets/input_field.dart';
import 'package:intern_test/src/view/widgets/password_field.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:intern_test/utils/validator.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlankAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "We're so excited to see you back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "ACCOUNT INFORMATION",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                InputField(
                  controller: controller.emailController,
                  hintText: "Email",
                  validator: Validator.validateEmail,
                ),
                const SizedBox(height: 15),
                PasswordField(
                  controller: controller.passwordController,
                  hintText: "Password",
                ),
                const SizedBox(height: 15),
                TextButton(
                    onPressed: () {}, child: const Text("Forget Password?")),
                const SizedBox(height: 8),
                ActionButton(
                  title: "Log in",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
