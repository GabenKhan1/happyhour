import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/duplicate_happyhour/duplicate_happyhour_controller.dart';

class DuplicateHappyhourBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DuplicateController());
  }
}
