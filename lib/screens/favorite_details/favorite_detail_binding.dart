import 'package:get/get.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';
import 'package:happy_hour/screens/favorite_details/favorite_detail_controller.dart';

class FavoriteDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteDetailController());
    Get.lazyPut(() => GlobalGeneralController());
  }
}
