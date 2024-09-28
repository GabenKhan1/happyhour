import 'package:get/instance_manager.dart';
import 'package:happy_hour/screens/account_business/add_for_guest/guest_controller.dart';

class GuestBarTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestController());
  }
}
