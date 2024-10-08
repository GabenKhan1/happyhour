import 'package:get/get.dart';
import 'package:happy_hour/screens/notification/notification_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
