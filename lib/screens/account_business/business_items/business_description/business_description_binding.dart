import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/account_business/business_items/addhappyhour_business_controller.dart';

class BusinessDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddHappyhourBusinessController());
  }
}
