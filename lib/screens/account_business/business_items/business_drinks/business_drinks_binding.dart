import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';

import '../addhappyhour_business_controller.dart';

class BusinessDrinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddHappyhourBusinessController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
