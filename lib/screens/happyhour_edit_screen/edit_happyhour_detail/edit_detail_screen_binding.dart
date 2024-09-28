import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/happyhour_edit_screen/edit_happyhour_detail/edit_detail_screen_controller.dart';

class EditDetailScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditDetailScreenController());
    Get.lazyPut(() => GlobalGeneralController());
    Get.lazyPut(() => AuthController());
  }
}
