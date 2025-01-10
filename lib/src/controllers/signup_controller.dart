import 'package:blog_app/services/firebase/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> registerUser(
      String email, String password, String fullName) async {
    try {
      isLoading(true);
      await AuthServices.instance
          .createUserWithEmailAndPassword(email, password);
      isLoading(false);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
