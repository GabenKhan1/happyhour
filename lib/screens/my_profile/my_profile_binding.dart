import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/screens/my_profile/my_profile_controller.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
    Get.lazyPut(() => AuthController());
  }
}
