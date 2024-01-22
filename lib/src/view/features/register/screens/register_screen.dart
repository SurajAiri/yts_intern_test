import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/login_controller.dart';
import 'package:intern_test/src/controllers/register_controller.dart';
import 'package:intern_test/src/view/widgets/action_button.dart';
import 'package:intern_test/src/view/widgets/blank_appbar.dart';
import 'package:intern_test/src/view/widgets/input_field.dart';
import 'package:intern_test/src/view/widgets/password_field.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:intern_test/utils/routes.dart';
import 'package:intern_test/utils/utility.dart';
import 'package:intern_test/utils/validator.dart';

import '../../../../../utils/assets_path.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({super.key});

  @override
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlankAppBar(),
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: kPagePadding,
              child: Column(
                children: [
                  // const SizedBox(height: 15),
                  Image.asset(
                    apLogoBannerPath,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      "Get your Mentor now!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Create your YoursThatSenior member profile and\n get first access to mentor for whatever you want.\n Claim your unfair advantage!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "REQUIRED INFORMATION",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: controller.usernameController,
                    hintText: "Username",
                    validator: Validator.validateUsername,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: controller.firstNameController,
                    hintText: "First Name",
                    validator: Validator.validateRequiredFields,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: controller.lastNameController,
                    hintText: "Last Name",
                    validator: Validator.validateRequiredFields,
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
                  PasswordField(
                    controller: controller.confirmPasswordController,
                    hintText: "Confirm Password",
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Required Field";
                      } else if (value != controller.passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.optedForEmailUpdates.value,
                          onChanged: (value) {
                            controller.optedForEmailUpdates.value =
                                value ?? controller.optedForEmailUpdates.value;
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Sign Up for email updates from YoursThatSenior",
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "By creating account, you agree to YoursThatSenior's ",
                      style: kNormalRichTextStyle,
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          style: kClickableRichTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showMyToast("Privacy Policy");
                            },
                        ),
                        const TextSpan(
                          text: " and ",
                          style: kNormalRichTextStyle,
                        ),
                        TextSpan(
                          text: "Terms of Use.",
                          style: kClickableRichTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showMyToast("Terms of Use");
                            },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Obx(
                    () => ActionButton(
                      title: controller.isLoading.value
                          ? "Processing..."
                          : "Register",
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.registerUser,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: kNormalRichTextStyle,
                      children: [
                        TextSpan(
                          text: "Sign In!",
                          style: kClickableRichTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                              Get.toNamed(Routes.loginScreen);
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
