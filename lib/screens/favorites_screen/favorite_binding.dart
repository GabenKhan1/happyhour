import 'package:get/instance_manager.dart';
import 'package:happy_hour/global_controller/auth_controller.dart';
import 'package:happy_hour/screens/favorites_screen/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
    Get.put(AuthController());
  }
}
