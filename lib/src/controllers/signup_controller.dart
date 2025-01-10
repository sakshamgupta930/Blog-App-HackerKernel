import 'package:blog_app/services/firebase/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  var isLoading = false.obs;

  void registerUser(String email, String passwrod, String fullName) {
    isLoading(true);
    AuthServices.instance.createUserWithEmailAndPassword(email, passwrod);
    isLoading(false);
  }
}
