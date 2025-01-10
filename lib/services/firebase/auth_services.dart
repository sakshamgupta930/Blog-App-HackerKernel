import 'dart:async';

import 'package:blog_app/services/firebase/exceptions/signup_failure.dart';
import 'package:blog_app/src/views/screens/dashboard_screen.dart';
import 'package:blog_app/src/views/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices extends GetxController {
  static AuthServices get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = _auth.currentUser.obs;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => DashboardScreen())
          : Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupFailure.code(e.code);
      print('firebase exception: ${ex.message}');
      throw ex;
    } catch (e) {
      const ex = SignupFailure();
      print('exception: ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignupFailure.code(e.code);
      print('firebase exception: ${ex.message}');
      throw ex;
    } catch (e) {
      const ex = SignupFailure();
      print('exception: ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
