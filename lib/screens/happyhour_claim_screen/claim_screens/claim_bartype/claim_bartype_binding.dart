import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';

import '../claim_controller.dart';

class ClaimBarTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
