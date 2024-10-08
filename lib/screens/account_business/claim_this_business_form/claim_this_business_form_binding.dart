import 'package:get/get.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/happyhour_claim_screen/claim_screens/claim_controller.dart';

class ClaimThisBusinessFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
