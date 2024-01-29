import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  final SplashScreenController splashController = Get.find();

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: Center(child: const Text("TODO App")));
  }
}
