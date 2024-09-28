import 'package:get/get.dart';
import 'package:happy_hour/screens/happyhour_claim_screen/claim_screens/claim_controller.dart';

class ClaimAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimController());
  }
}
