import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/login_controller.dart';
import 'package:intern_test/src/view/features/splash/widgets/spinning_widget.dart';
import 'package:intern_test/utils/assets_path.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:intern_test/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreenId";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (Get.find<LoginController>().user != null) {
        Get.offAndToNamed(Routes.todoScreen);
      } else {
        Get.offAndToNamed(Routes.loginOnboardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                  child: Padding(
                padding: kPagePadding,
                child: Column(
                  children: [
                    const Spacer(),
                    Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.lightBlueAccent[50],
                        child: Image.asset(
                          apAppLogoPath,
                          width: 150,
                        ),
                      ),
                      // child: Text("Loading..."),
                    ),
                    const Spacer(),
                    const SpinningWidget(),
                    const SizedBox(height: 20),
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
