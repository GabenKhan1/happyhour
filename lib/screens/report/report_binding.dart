import 'package:get/get.dart';
import 'package:happy_hour/screens/report/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}
