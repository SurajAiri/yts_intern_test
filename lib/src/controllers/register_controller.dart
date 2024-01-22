import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/utils/utility.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxBool isLoading = false.obs;
  RxBool optedForEmailUpdates = false.obs;

  void registerUser() async {
    // todo: register logic goes here
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      showMyToast("Account registration");
      isLoading.value = false;
    });
  }
}
