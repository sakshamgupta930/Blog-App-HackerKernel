import 'package:blog_app/services/firebase/auth_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthServices _authServices = AuthServices();

  @override
  void onInit() {
    super.onInit();
    Get.put(_authServices);
  }
}
