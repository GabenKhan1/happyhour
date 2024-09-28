import 'package:get/get.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/screens/credientials/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
    Get.lazyPut(() => AuthController());
  }
}
