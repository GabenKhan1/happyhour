import 'package:get/get.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/duplicate_happyhour/duplicate_happyhour_controller.dart';

class DuplicateFoodItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DuplicateController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
