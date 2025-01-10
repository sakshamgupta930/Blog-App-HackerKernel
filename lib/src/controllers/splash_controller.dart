import 'package:blog_app/services/firebase/splash_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SplashServices().isLogin();
  }
}
