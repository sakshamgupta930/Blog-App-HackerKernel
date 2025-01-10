import 'dart:async';
import 'package:blog_app/src/views/screens/login_screen.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(const Duration(seconds: 3), () {
      Get.to(
        () => LoginScreen(),
        // transition: Transition.rightToLeftWithFade,
        // duration: const Duration(milliseconds: 500),
      );
    });
  }
}
