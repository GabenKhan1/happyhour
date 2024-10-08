import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_hour/data/models/filter_model.dart';
import 'package:happy_hour/data/models/happyhour_model.dart';
import 'package:happy_hour/data/providers/add_happyhour_provider.dart';
import 'package:happy_hour/global_controller/global_general_controller.dart';

class BusinessFilterScreenController extends GetxController {
  final searchController = TextEditingController();
  final AddHappyHourProvider addHappyHourProvider = AddHappyHourProvider();

  FilterModel filter = FilterModel();
  List<HappyHourModel> searchList = [];
  String days = "Sunday";
  String time = "01:00 PM";
  String distance = "mi";
  String drink = "Drinks";
  String food = "Foods";
  String amenities = "Amenities";
  String events = "Events";
  String barType = "BarType";

  List<String> searchListItem = [];

//============Fetch Radius List ============//
  final AddHappyHourProvider _addHappyHourProvider = AddHappyHourProvider();

  final RxList<HappyHourModel> _hoursRadiusList = <HappyHourModel>[].obs;
  List<HappyHourModel> get hoursInRadiusList => _hoursRadiusList;

  fetchHoursinRadius() {
    _addHappyHourProvider
        .fetchHourInradius(
      lat: Get.find<GlobalGeneralController>().lat,
      long: Get.find<GlobalGeneralController>().long,
      rad: range * 4,
    )
        .listen((hours) {
      List<HappyHourModel> _temp = [];
      for (var hour in hours) {
        _temp.add(
          HappyHourModel.fromDocument(
            hour as DocumentSnapshot<Map<String, dynamic>>,
            hour.id.toString(),
          ),
        );
      }
      _hoursRadiusList.value = _temp;
    });
  }

  final Rx<double> _range = 10.0.obs;
  double get range => _range.value;
  set range(value) => _range.value = value;

  void setRange(double slide) {
    range = slide;
    fetchHoursinRadius();
    update();
  }

  Future<void> getAllHoursData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("happyhours").get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //print("hfdsfkhdkjhskjhgfdf ghskjlfdhks");
    for (var element in allData) {
      HappyHourModel allHours =
          HappyHourModel.fromDoc(Map.from(element as Map));
      // var a = allHours.day!.where((e) => e['Hday']);
      // print(a);
      hoursModelList.add(allHours);
    }
  }

  @override
  void onInit() async {
    fetchHoursinRadius();
    await getAllHoursData();

    super.onInit();
  }

  final Rx<List<HappyHourModel>> _hourModelList = Rx<List<HappyHourModel>>([]);
  List<HappyHourModel> get hoursModelList => _hourModelList.value;
  set hoursModelList(value) => _hourModelList.value = value;

  //Filtered list
  final Rx<List<HappyHourModel>> _hourModelListFilter =
      Rx<List<HappyHourModel>>([]);
  List<HappyHourModel> get hoursCityListFilter => _hourModelListFilter.value;
  set hoursCityListFilter(value) => _hourModelListFilter.value = value;

  onSearch(String query) {
    // if (days.isNotEmpty) {
    //   for (var e in hoursModelList) {
    //     for (var day in e.day!) {
    //       if (day['Hday'].toLowerCase().toString() == days.toLowerCase()) {
    //         hoursCityListFilter = hoursModelList;
    //       }
    //     }
    //   }
    //   // hoursCityListFilter =
    //   //     hoursModelList.where((e) => e.day.toString() == days).toList();
    // }
    // if (time.isNotEmpty) {
    //   for (var e in hoursModelList) {
    //     for (var t in e.day!) {
    //       if (t['HfromTime'].toLowerCase().toString() == time.toLowerCase().toString()) {
    //         hoursCityListFilter = hoursModelList;
    //       }
    //     }
    //   }
    // }
    if (query.isNotEmpty) {
      hoursCityListFilter = hoursModelList.where((element) {
        return element.businessAddress!
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    } else {
      hoursCityListFilter = hoursModelList;
    }
  }

  var daysList = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  var timesList = [
    "01:00 AM",
    "02:00 AM",
    "03:00 AM",
    "04:00 AM",
    "05:00 AM",
    "06:00 AM",
    "07:00 AM",
    "08:00 AM",
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 AM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
    "06:00 PM",
    "07:00 PM",
    "08:00 PM",
    "09:00 PM",
    "10:00 PM",
    "11:00 PM",
    "12:00 PM",
  ];

  var distanceList = [
    'Mi',
    'Km',
  ];

  var drinkList = [
    "Domestic Beer",
    "Craft Beer",
    "Import Beer",
    "Mexican Beer",
    "Michelada",
    "Wine",
    "Brandi",
    "You call it- Well",
    "You call it- Premium",
    "Mixed Drink- Well",
    "Mixed Drink- Premium",
    "Margarita-Well",
    "Margarita- Premium",
    "Martini- Well",
    "Martini- Premium",
    "Bloody Mary-Well",
    "Bloody Mary- Premium",
    "Mojito- Well",
    "Mojito- Premium",
    "Long Island- Well",
    "Long Island- Premium",
    "Other Whisky/Bourbon Drink- Well",
    "Other Whisky/Bourbon Drink - Premium",
    "Other Vodka Drink- Well",
    "Other Vodka Drink- Premium",
    "Other Rum Drink- Well",
    "Other Rum Drink- Premium",
    "Other Gin Drink- Well",
    "Other Gin Drink- Premium",
    "Other Tequila/Mezcal Drink- Well",
    "Other Tequila/Mezcal Drink- Premium",
    "Sangria",
    "Saki",
    "Seltzer",
    "Mule",
  ];

  var foodsList = [
    "Bone in Wings",
    "Boneless Wings",
    "Pizza",
    "Flat Bread",
    "Burger",
    "Burger- Sliders",
    "Nachos",
    "Nachos Chicken/Steak",
    "Nachos- Ahi",
    "Tacos",
    "Taquitos/Flautas",
    "Quesadilla",
    "Fries",
    "Fries- Loaded",
    "Pretzels",
    "Garlic Bread/Knots",
    "Cheese Bread",
    "Bruschetta",
    "Mozzarella Sticks",
    "Dip - Cheese",
    "Dip- Spinach",
    "Dip- Salsa",
    "Dip- Guacamole",
    "Dip- Artichoke",
    "Dip- Hummus",
    "Chicken- Tenders",
    "Chicken- Fried",
    "Chicken- Grilled",
    "Chicken-Other",
    "Potato Skins",
    "Potatos- Loaded",
    "Tater Tots",
    "Tater Tots- Loaded",
    "Chips/Crisps",
    "Onion Rings",
    "Onion Blossom",
    "Zucchini",
    "Jalapeno Poppers",
    "Pickles- Fried",
    "Mac and Cheese Bites",
    "Combo Platter",
    "Egg Roll",
    "Dumpling/ Wonton/ Pot Sticker",
    "Pita",
    "Wrap",
    "Sandwich- Cold",
    "Sandwich- Hot",
    "Soup",
    "Salad",
    "Pasta",
    "Ravioli",
    "Meatballs",
    "Meatloaf",
    "Kabab/Skewer",
    "Steak",
    "Ribs",
    "Cheese Plate/Platter",
    "Cheese- Curds",
    "Cheese and Meat Platter",
    "Carpaccio",
    "Sushi- Roll",
    "Sushi- Sashimi or Nigiri",
    "Sushi- Handroll",
    "Sushi- Platter",
    "Poke",
    "Edamame",
    "Calamari",
    "Shrimp",
    "Oysters",
    "Scallops",
    "Mussels",
    "Crab- Cakes",
    "Crab- Meat",
    "Crab- Leggs",
    "Crab- Whole",
    "Fish and Chips",
    "Other Fish Dish",
    "Burrito",
    "Empanadas",
    "Tapas",
    "Meat Pie",
    "Mushrooms",
    "Hotdog/Corn Dog",
    "Fondue",
  ];

  var amenitiesList = [
    "Pool Table",
    "Dart Boards",
    "Juke Box",
    "Arcade",
    "Shuffle Board",
    "Board Games",
    "Outdoor Smoking",
    "Indoor Smoking",
    "No Smoking",
    "NFL Package",
    "NBA Package",
    "MLB Package",
    "Soccer/Football Package",
    "UFC PPV",
    "Boxing PPV",
    "Casino",
    "Large Screens",
    "Pool (Swimming)",
    "Outdoor Seating Assigned",
    "Outdoor Space Unassigned",
    "Beach/Water Front",
    "Amazing Views",
  ];

  List<Select> multiAmenitiesList = [
    Select(id: 1, name: "Pool Table"),
    Select(id: 2, name: "Dart Boards"),
    Select(id: 3, name: "Juke Box"),
    Select(id: 4, name: "Arcade"),
    Select(id: 5, name: "Shuffle Board"),
    Select(id: 6, name: "Board Games"),
    Select(id: 7, name: "Outdoor Smoking"),
    Select(id: 8, name: "Indoor Smoking"),
    Select(id: 9, name: "No Smoking"),
    Select(id: 10, name: "NFL Package"),
    Select(id: 12, name: "NBA Package"),
    Select(id: 13, name: "MLB Package"),
    Select(id: 14, name: "Soccer/Football Package"),
    Select(id: 15, name: "UFC PPV"),
    Select(id: 16, name: "Boxing PPV"),
    Select(id: 17, name: "Casino"),
    Select(id: 18, name: "Large Screens"),
    Select(id: 19, name: "Pool (Swimming)"),
    Select(id: 20, name: "Outdoor Seating Assigned"),
    Select(id: 21, name: "Outdoor Space Unassigned"),
    Select(id: 22, name: "Beach/Water Front"),
    Select(id: 23, name: "Amazing Views"),
  ];

  List<Select> multiEventList = [
    Select(id: 1, name: "Pool Tournament"),
    Select(id: 2, name: "Free Pool"),
    Select(id: 3, name: "Dart Tournament"),
    Select(id: 4, name: "Cornhole Tournament"),
    Select(id: 5, name: "Beer Pong Tournament"),
    Select(id: 6, name: "Other Tournament"),
    Select(id: 7, name: "Karaoke"),
    Select(id: 8, name: "Trivia Night"),
    Select(id: 9, name: "Live Music "),
    Select(id: 10, name: "Comedy Night"),
    Select(id: 12, name: "Open Mic"),
    Select(id: 13, name: "Paint and Sip"),
    Select(id: 14, name: "Ladies Night"),
    Select(id: 15, name: "Industry Night"),
  ];
  List<Select> multiBarList = [
    Select(id: 1, name: "Restaurant"),
    Select(id: 2, name: "Restaurant with Bar"),
    Select(id: 3, name: "Bar-Only"),
    Select(id: 4, name: "Bar with Food"),
    Select(id: 5, name: "Sports Bar"),
    Select(id: 6, name: "Brewery"),
    Select(id: 7, name: "Owner Owned"),
    Select(id: 8, name: "Corporate Owned"),
    Select(id: 9, name: "Dive"),
    Select(id: 10, name: "Upscale"),
    Select(id: 12, name: "Ulta High-End"),
    Select(id: 13, name: "Winery"),
    Select(id: 14, name: "Distillery"),
    Select(id: 15, name: "Pool Hall"),
    Select(id: 16, name: "Casino"),
    Select(id: 17, name: "Club"),
    Select(id: 18, name: "Strip Club"),
    Select(id: 19, name: "Roof Top"),
  ];
  List<Select> multiFoodList = [
    Select(id: 1, name: "Bone in Wings"),
    Select(id: 2, name: "Boneless Wings"),
    Select(id: 3, name: "Pizza"),
    Select(id: 4, name: "Flat Bread"),
    Select(id: 5, name: "Burger"),
    Select(id: 6, name: "Burger- Sliders"),
    Select(id: 7, name: "Nachos"),
    Select(id: 8, name: "Nachos Chicken/Steak"),
    Select(id: 9, name: "Nachos- Ahi"),
    Select(id: 10, name: "Tacos"),
    Select(id: 11, name: "Taquitos/Flautas"),
    Select(id: 12, name: "Margarita-Well"),
    Select(id: 13, name: "Fries"),
    Select(id: 14, name: "Fries- Loaded"),
    Select(id: 15, name: "Pretzels"),
    Select(id: 16, name: "Garlic Bread/Knots"),
    Select(id: 17, name: "Cheese Bread"),
    Select(id: 18, name: "Bruschetta"),
    Select(id: 19, name: "Mozzarella Sticks"),
    Select(id: 20, name: "Dip - Cheese"),
    Select(id: 21, name: "Dip- Spinach"),
    Select(id: 22, name: "Dip- Salsa"),
    Select(id: 23, name: "Dip- Guacamole"),
    Select(id: 24, name: "Dip- Artichoke"),
    Select(id: 25, name: "Dip- Hummus"),
    Select(id: 26, name: "Chicken- Tenders"),
    Select(id: 27, name: "Chicken- Fried"),
    Select(id: 28, name: "Chicken- Grilled"),
    Select(id: 28, name: " Chicken-Other"),
    Select(id: 29, name: "Potato Skins"),
    Select(id: 30, name: "Potatos- Loaded"),
    Select(id: 31, name: "Tater Tots"),
    Select(id: 32, name: "Tater Tots- Loaded"),
    Select(id: 33, name: "Chips/Crisps"),
    Select(id: 34, name: "Onion Rings"),
    Select(id: 35, name: "Onion Blossom"),
    Select(id: 36, name: "Zucchini"),
    Select(id: 37, name: "Jalapeno Poppers"),
    Select(id: 38, name: "Pickles- Fried"),
    Select(id: 39, name: "Mac and Cheese Bites"),
    Select(id: 40, name: "Combo Platter"),
    Select(id: 41, name: "Egg Roll"),
    Select(id: 42, name: "Dumpling/ Wonton/ Pot Sticker"),
    Select(id: 43, name: "Pita"),
    Select(id: 44, name: "Wrap"),
    Select(id: 45, name: "Sandwich- Cold"),
    Select(id: 46, name: "Sandwich- Hot"),
    Select(id: 47, name: "Soup"),
    Select(id: 48, name: "Salad"),
    Select(id: 49, name: "Pasta"),
    Select(id: 50, name: "Ravioli"),
    Select(id: 51, name: "Meatballs"),
    Select(id: 52, name: "Meatloaf"),
    Select(id: 53, name: "Kabab/Skewer"),
    Select(id: 54, name: "Steak"),
    Select(id: 55, name: "Ribs"),
    Select(id: 56, name: "Cheese Plate/Platter"),
    Select(id: 56, name: " Cheese- Curds"),
    Select(id: 57, name: "Cheese and Meat Platter"),
    Select(id: 58, name: "Carpaccio"),
    Select(id: 59, name: "Sushi- Roll"),
    Select(id: 60, name: "Sushi- Sashimi or Nigiri"),
    Select(id: 61, name: "Sushi- Handroll"),
    Select(id: 62, name: "Sushi- Platter"),
    Select(id: 63, name: "Poke"),
    Select(id: 64, name: "Edamame"),
    Select(id: 65, name: "Calamari"),
    Select(id: 66, name: "Shrimp"),
    Select(id: 67, name: "Oystersl"),
    Select(id: 68, name: "Scallops"),
    Select(id: 69, name: "Mussels"),
    Select(id: 70, name: "Crab- Cakes"),
    Select(id: 71, name: "Crab- Meat"),
    Select(id: 72, name: "Crab- Leggs"),
    Select(id: 73, name: "Crab- Whole"),
    Select(id: 74, name: "Fish and Chips"),
    Select(id: 75, name: "Other Fish Dish"),
    Select(id: 76, name: "Burrito"),
    Select(id: 77, name: "Empanadas"),
    Select(id: 78, name: "Tapas"),
    Select(id: 79, name: "Meat Pie"),
    Select(id: 80, name: "Mushrooms"),
    Select(id: 81, name: "Hotdog/Corn Dog"),
    Select(id: 82, name: "Fondue"),
  ];
  var eventsList = [
    "Pool Tournament",
    "Free Pool",
    "Dart Tournament",
    "Cornhole Tournament",
    "Beer Pong Tournament",
    "Other Tournament",
    "Karaoke",
    "Trivia Night",
    "Live Music ",
    "Comedy Night",
    "Open Mic",
    "Paint and Sip",
    "Ladies Night",
    "Industry Night",
  ];

  var barList = [
    "Restaurant",
    "Restaurant with Bar",
    "Bar-Only",
    "Bar with Food",
    "Sports Bar",
    "Brewery",
    "Owner Owned",
    "Corporate Owned",
    "Dive",
    "Upscale",
    "Ulta High-End",
    "Winery",
    "Distillery",
    "Pool Hall",
    "Bowling Alley",
    "Casino",
    "Club",
    "Strip Club",
    "Roof Top",
  ];

  List<Select> multidrinkList = [
    Select(id: 1, name: "Domestic Beer"),
    Select(id: 2, name: "Craft Beer"),
    Select(id: 3, name: "Import Beer"),
    Select(id: 4, name: "Mexican Beer"),
    Select(id: 5, name: "Michelada"),
    Select(id: 6, name: "Wine"),
    Select(id: 7, name: "Brandi"),
    Select(id: 8, name: "You call it- Well"),
    Select(id: 9, name: "You call it- Premium"),
    Select(id: 10, name: "Mixed Drink- Well"),
    Select(id: 11, name: "Mixed Drink- Premium"),
    Select(id: 12, name: "Margarita-Well"),
    Select(id: 13, name: "Margarita- Premium"),
    Select(id: 14, name: "Martini- Well"),
    Select(id: 15, name: "Martini- Premium"),
    Select(id: 16, name: "Bloody Mary-Well"),
    Select(id: 17, name: "Bloody Mary- Premium"),
    Select(id: 18, name: "Mojito- Well"),
    Select(id: 19, name: "Mojito- Premium"),
    Select(id: 20, name: "Long Island- Well"),
    Select(id: 21, name: "Long Island- Premium"),
    Select(id: 22, name: "Other Whisky/Bourbon Drink- Well"),
    Select(id: 23, name: " Other Whisky/Bourbon Drink - Premium"),
    Select(id: 24, name: "Other Vodka Drink- Well"),
    Select(id: 25, name: "Other Vodka Drink- Premium"),
    Select(id: 26, name: "Other Rum Drink- Well"),
    Select(id: 27, name: "Other Rum Drink- Premium"),
    Select(id: 28, name: "Other Gin Drink- Well"),
    Select(id: 29, name: "Other Gin Drink- Premium"),
    Select(id: 30, name: "Other Tequila/Mezcal Drink- Well"),
    Select(id: 31, name: "Other Tequila/Mezcal Drink- Premium"),
    Select(id: 32, name: "Sangria"),
    Select(id: 33, name: "Saki"),
    Select(id: 34, name: "Seltzer"),
    Select(id: 35, name: "Mule"),
  ];

  void addDrinkFromDropDownList(List<Select> p1) {
    for (var e in p1) {
      searchListItem.add(e.name);

      update();
    }
  }

  void addFoodFromDropDownList(List<Select> p1) {
    for (var e in p1) {
      searchListItem.add(e.name);

      update();
    }
  }

  void addAmenitiesFromDropDownList(List<Select> p1) {
    for (var e in p1) {
      searchListItem.add(e.name);

      update();
    }
  }

  void addEventFromDropDownList(List<Select> p1) {
    for (var e in p1) {
      searchListItem.add(e.name);

      update();
    }
  }

  void addBarTypeFromDropDownList(List<Select> p1) {
    for (var e in p1) {
      searchListItem.add(e.name);

      update();
    }
  }
}

//==============*New Search Method *================//

class Select {
  final int id;
  final String name;

  Select({
    required this.id,
    required this.name,
  });
}
