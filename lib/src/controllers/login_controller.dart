import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intern_test/src/model/auth_user_model.dart';
import 'package:intern_test/src/services/all_apis.dart';
import 'package:intern_test/utils/api_callback_listener.dart';
import 'package:intern_test/utils/routes.dart';
import 'package:intern_test/utils/utility.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  // username: 'kminchelle',
  //   password: '0lelplR',

  AuthUserModel? user;

  RxBool isLoading = false.obs;

  void login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    user = await AllApis.loginWithEmail(
        email: usernameController.text,
        password: passwordController.text,
        listener: ApiCallListener(
          onSuccess: () {
            // Todo: go to home screen
            Get.toNamed(Routes.todoScreen);
            showMyToast("User logged in");
            clearFields();
          },
          onError: (error) {
            showMyToast(error, isError: true);
          },
          onCompleted: () {
            isLoading.value = false;
          },
        ));
  }

  void clearFields() {
    passwordController.clear();
    usernameController.clear();
  }

  void logout() {
    user = null;
  }
}
