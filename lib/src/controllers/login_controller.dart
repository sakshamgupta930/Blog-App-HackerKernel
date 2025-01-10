import 'package:blog_app/services/firebase/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading(true);
    await AuthServices.instance.loginWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    isLoading(false);
  }
}
