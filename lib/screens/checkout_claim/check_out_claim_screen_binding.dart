import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/checkout_claim/check_out_claim_screen_controller.dart';

class CheckOutClaimScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutClaimScreenController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
