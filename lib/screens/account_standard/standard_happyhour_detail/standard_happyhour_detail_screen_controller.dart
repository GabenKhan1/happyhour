import 'package:get/get.dart';
import 'package:happy_hour/data/models/happyhour_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/hour_favorite_model.dart';
import '../../../data/providers/favorite_provider.dart';
import '../../../global_controller/global_general_controller.dart';
import '../../../routes/app_routes.dart';

class StandardHappyhourDetailScreenController extends GetxController {
  final FavoriteProvider favoriteProvider = FavoriteProvider();
  final HappyHourModel happyHour = Get.arguments;
  HoursFavoriteModel hour = HoursFavoriteModel(
    hid: Get.arguments.hid,
    businessName: "",
    description: "",
    menuImage: "",
    businessImage: "",
  );

  //observable variables
  final _switchs = 0.obs;
  int get switches => _switchs.value;
  set switches(value) => _switchs.value = value;

  // void hourIds() {
  //   hour = HoursFavoriteModel(
  //     hid: happyHour.id!,
  //     businessName: "",
  //     description: "",
  //     menuImage: "",
  //     businessImage: "",
  //   );
  //   update();
  // }
  List lateFoodList = [];
  lateFoodItems() {
    for (var i = 0; i < happyHour.foodName!.length; i++) {
      if (happyHour.foodName?[i]['late'] == true) {
        lateFoodList.add(happyHour.foodName?[i]);
      }
    }
    // print(lateFoodList);
    // print(lateFoodList.length);
  }

  List lateDrinkList = [];
  lateDrinkItems() {
    for (var i = 0; i < happyHour.drinkitemName!.length; i++) {
      if (happyHour.drinkitemName?[i]['late'] == true) {
        lateDrinkList.add(happyHour.drinkitemName?[i]);
      }
    }
    // print(lateDrinkList);
    // print(lateDrinkList.length);
  }

  List menuImageList = [];
  menuAllImages() {
    if (happyHour.menuImage != null) {
      menuImageList.add(happyHour.menuImage);
    }
    if (happyHour.menuImage2 != null) {
      menuImageList.add(happyHour.menuImage2);
    }
  }

  String id = Get.arguments.id;
  onAddreviewTap() {
    Get.toNamed(Routes.addReviewScreen, arguments: id);
  }

  onAddreportTap() {
    Get.toNamed(Routes.reportScreen, arguments: id);
  }

  List sundayList = [];
  List mondayList = [];
  List tuesdayList = [];
  List wednesdayList = [];
  List thursdayList = [];
  List fridayList = [];
  List saturdayList = [];
  dailySpecialData() {
    for (var i = 0; i < happyHour.dailySpecils!.length; i++) {
      if (happyHour.dailySpecils?[i]['day'] == "Sunday") {
        sundayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Monday") {
        mondayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Tuesday") {
        tuesdayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Wednesday") {
        wednesdayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Thursday") {
        thursdayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Friday") {
        fridayList.add(happyHour.dailySpecils?[i]);
      }
      if (happyHour.dailySpecils?[i]['day'] == "Saturday") {
        saturdayList.add(happyHour.dailySpecils?[i]);
      }
    }
  }

  @override
  void onInit() {
    menuAllImages();
    lateFoodItems();
    lateDrinkItems();
    dailySpecialData();
    super.onInit();
  }

  final RxBool _show = false.obs;
  bool get show => _show.value;
  set show(value) => _show.value = value;

  void showReply() {
    show = !show;
  }

  void _launchURL(url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.find<GlobalGeneralController>().errorSnackbar(
        title: "Error",
        description: 'Could not launch $url',
      );
    }
  }

  onDirectionTap(uri) {
    _launchURL(Uri.parse(uri));
  }
}
