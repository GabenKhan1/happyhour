import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/duplicate_happyhour/duplicate_happyhour_controller.dart';

class DuplicateAmenitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DuplicateController());
  }
}
