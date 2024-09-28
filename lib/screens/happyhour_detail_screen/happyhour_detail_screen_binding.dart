import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/happyhour_detail_screen/happyhour_detail_screen_controller.dart';

class HappyhourDetailScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HappyhourDetailScreenController());
    Get.lazyPut(() => GlobalGeneralController());
    Get.lazyPut(() => AuthController());
  }
}
