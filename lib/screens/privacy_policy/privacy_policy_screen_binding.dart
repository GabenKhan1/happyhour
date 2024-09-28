import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/privacy_policy/privacy_policy_screen_controller.dart';

class PrivacyPolicyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyScreenController());
  }
}
