import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/screens/credientials/signup/standard_account_signup/standard_account_signup_controller.dart';

class StandardAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StandardAccountController());
    Get.lazyPut(() => AuthController());
  }
}
