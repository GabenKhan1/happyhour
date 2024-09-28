import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/duplicate_happyhour/duplicate_happyhour_controller.dart';

class DuplicateDayTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DuplicateController());
  }
}
