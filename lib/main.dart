import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/view/features/login/screens/login_onboard_screen.dart';
import 'package:intern_test/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Routes.routes,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginOnboardScreen(),
    );
  }
}
