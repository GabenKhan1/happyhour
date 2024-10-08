import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_hour/core/colors.dart';
import 'package:happy_hour/global_widgets/circular_indicator.dart';
import 'package:happy_hour/global_widgets/happyhour_card.dart';
import 'package:happy_hour/global_widgets/main_button.dart';
import 'package:happy_hour/screens/happyhour_edit_screen/edit_screens/edit_controller.dart';

import '../../core/constants.dart';
import '../../routes/app_routes.dart';

class HappyHourEditScreen extends GetView<EditController> {
  const HappyHourEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomCircleIndicator(
        opacity: 0.5,
        isEnabled: controller.isLoading,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/Group 9108.svg",
                    height: 25,
                    width: 25,
                  )),
              // title: const Text(
              //   "Lorem Ipsum Store",
              // ),
              title: Text(controller.hour.businessName.toString()),
              centerTitle: true,
            ),
            extendBodyBehindAppBar: false,
            body: SingleChildScrollView(
              child: GetBuilder<EditController>(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Column(
                      children: [
                        Obx(() => Stack(
                              children: [
                                SizedBox(
                                    height: H * 0.25,
                                    width: W * 1.2,
                                    child: controller.happyHourMenuImage != ""
                                        ? controller.happyHourMenuImage
                                                .contains("image_picker")
                                            ? Image.file(
                                                File(controller
                                                    .happyHourMenuImage),
                                                width: W * 0.95,
                                                height: H * 0.2,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                controller.hour.menuImage
                                                    .toString(),
                                                fit: BoxFit.fitWidth,
                                              )
                                        : Image.network(
                                            controller.happyHourMenuImage,
                                            fit: BoxFit.cover,
                                          )
                                    // : Image.file(
                                    //     File(controller.image),
                                    //     width: W * 0.95,
                                    //     height: H * 0.2,
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    ),
                                Positioned(
                                  top: 10,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editAccountScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.05,
                                      // width: W * 0.05,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: H * 0.031,
                        ),
                        NewCard(
                          title: controller.businessNameController.text,
                          subtitle:
                              controller.businessAddressController.text == ""
                                  ? controller.hour.businessAddress.toString()
                                  : controller.businessAddressController.text,
                          image: "assets/icons/Group 11550.png",
                          timeIcon: "assets/icons/Group 11609@2x.png",
                          time: controller.hour.countList?.length.toString() ??
                              "",
                          rating: Container(),
                          rateCount: "",
                        ),
                        SizedBox(height: H * 0.02),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editDescriptionScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Text(
                                controller.descriptionController.text
                                            .toString() ==
                                        ""
                                    ? controller.hour.description.toString()
                                    : controller.descriptionController.text
                                        .toString(),
                                textAlign: TextAlign.left,

                                // overflow: TextOverflow.ellipsis,
                                //softWrap: false,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Business Hour",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editHourScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 30 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.selecteddays.isEmpty
                                    ? controller.hour.fromTimeToTime?.length
                                    : controller.selecteddays.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      controller.dayFromTimeToTimeList.isEmpty
                                          ? Row(
                                              children: [
                                                SizedBox(
                                                  width: W * 0.25,
                                                  child: Text(
                                                      "•  ${controller.hour.fromTimeToTime?[index]['bDay']}"),
                                                ),
                                                Text(
                                                    "${controller.hour.fromTimeToTime?[index]['bFtime']}   -"
                                                    "    ${controller.hour.fromTimeToTime?[index]['bTtime']}"),
                                              ],
                                            )
                                          : controller.selecteddays.isNotEmpty
                                              ? Row(
                                                  children: [
                                                    SizedBox(
                                                      width: W * 0.25,
                                                      child: Text(
                                                          "• ${controller.selecteddays[index]['bDay']}"),
                                                    ),
                                                    Text(
                                                        "${controller.selecteddays[index]['bFtime']}   -"
                                                        "  ${controller.selecteddays[index]['bTtime']}"),
                                                  ],
                                                )
                                              : const SizedBox(),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Happy Hour Times",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editDayTimeScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Early Happy Hour time",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 30 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.hDayTimeList.isEmpty
                                    ? controller.hour.day?.length
                                    : controller.hDayTimeList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      controller.dayTimeList.isEmpty
                                          ? Row(
                                              children: [
                                                SizedBox(
                                                  width: W * 0.25,
                                                  child: Text(
                                                      "•  ${controller.hour.day?[index]['Hday']}"),
                                                ),
                                                Text(
                                                    "    ${controller.hour.day?[index]['HfromTime']}  -"
                                                    "    ${controller.hour.day?[index]['HtoTime']}"),
                                              ],
                                            )
                                          : controller.hDayTimeList.isNotEmpty
                                              ? Row(
                                                  children: [
                                                    SizedBox(
                                                      width: W * 0.25,
                                                      child: Text(
                                                          "•  ${controller.hDayTimeList[index]['Hday']}"),
                                                    ),
                                                    Text(
                                                        " ${controller.hDayTimeList[index]['HfromTime']}   -"
                                                        "   ${controller.hDayTimeList[index]['HtoTime']}"),
                                                  ],
                                                )
                                              : const SizedBox(),

                                      // Text(controller.dayTimeList.isEmpty
                                      //     ? "•  ${controller.hour.day?[index]['Hday']}"
                                      //         "    ${controller.hour.day?[index]['HfromTime']} -"
                                      //         "    ${controller.hour.day?[index]['HtoTime']}"
                                      //     : controller.hDayTimeList.isNotEmpty
                                      //         ? "•  ${controller.hDayTimeList[index]['Hday']}"
                                      //             "    ${controller.hDayTimeList[index]['HfromTime']} -"
                                      //             "    ${controller.hDayTimeList[index]['HtoTime']}"
                                      //         : ""),
                                    ],
                                  );
                                },
                              ),
                              controller.hour.dayLate!.isNotEmpty
                                  ? const Text(
                                      "Late Happy Hour time",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              controller.hour.dayLate!.isNotEmpty
                                  ? GridView.builder(
                                      physics: const ScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 30 / 2,
                                        crossAxisCount: 1,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: controller
                                              .hDayTimeLateList.isEmpty
                                          ? controller.hour.dayLate?.length
                                          : controller.hDayTimeLateList.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            controller.hDayTimeLateList.isEmpty
                                                ? Row(
                                                    children: [
                                                      SizedBox(
                                                        width: W * 0.25,
                                                        child: Text(
                                                            "•  ${controller.hour.dayLate?[index]['Hday2'].toString()}"),
                                                      ),
                                                      Text(
                                                          "   ${controller.hour.dayLate?[index]['HfromTime2'].toString()}   -"
                                                          "   ${controller.hour.dayLate?[index]['HtoTime2'].toString()}"),
                                                    ],
                                                  )
                                                : controller.hDayTimeLateList
                                                        .isNotEmpty
                                                    ? Row(
                                                        children: [
                                                          SizedBox(
                                                            width: W * 0.25,
                                                            child: Text(
                                                                "•  ${controller.hDayTimeLateList[index]['Hday2']}"),
                                                          ),
                                                          Text(
                                                              "   ${controller.hDayTimeLateList[index]['HfromTime2']}   -"
                                                              "   ${controller.hDayTimeLateList[index]['HtoTime2']}"),
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                          ],
                                        );
                                      },
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Food Items",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editFoodItemScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Quantity",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Discount",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 24 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.foodList.isEmpty
                                    ? controller.hour.foodName?.length
                                    : controller.foodList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: W * 0.28,
                                        child: Text(controller.foodList.isEmpty
                                            ? "•  ${controller.hour.foodName?[index]['foodname']}"
                                            : "•  ${controller.foodList[index].name}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.23,
                                        child: Text(controller.foodList.isEmpty
                                            ? "•  ${controller.hour.foodName?[index]['foodcount']}"
                                            : "•  ${controller.foodList[index].quantity}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.25,
                                        child: Text(controller.foodList.isEmpty
                                            ? "•  ${controller.hour.foodName?[index]['foodprice']}"
                                            : "•  ${controller.foodList[index].price}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.09,
                                        child: Text(controller.foodList.isEmpty
                                            ? "•  ${controller.hour.foodName?[index]['fooddiscount']}"
                                            : "•  ${controller.foodList[index].discount}"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Drink Items",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editDrinksScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Name    ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Size",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Discount",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 24 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.localdrinkList.isEmpty
                                    ? controller.hour.drinkitemName?.length
                                    : controller.localdrinkList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: W * 0.28,
                                        child: Text(controller
                                                .localdrinkList.isEmpty
                                            ? "•  ${controller.hour.drinkitemName?[index]['drinkname']}"
                                            : "•  ${controller.localdrinkList[index].name}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.23,
                                        child: Text(controller
                                                .localdrinkList.isEmpty
                                            ? "•  ${controller.hour.drinkitemName?[index]['drinksize']}"
                                            : "•  ${controller.localdrinkList[index].size}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.25,
                                        child: Text(controller
                                                .localdrinkList.isEmpty
                                            ? "•  ${controller.hour.drinkitemName?[index]['drinkprice']}"
                                            : "•  ${controller.localdrinkList[index].price}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.09,
                                        child: Text(controller
                                                .localdrinkList.isEmpty
                                            ? "•  ${controller.hour.drinkitemName?[index]['rinkdiscount']}"
                                            : "•  ${controller.localdrinkList[index].discount}"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Daily Special",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editDailySpecialScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Day",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Size/Quantity",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 24 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount:
                                    controller.alldailySpecialList.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: W * 0.2,
                                        child: Text(controller
                                                .alldailySpecialList.isEmpty
                                            ? "  •${controller.hour.dailySpecils?[index]['day']}"
                                            : "   •${controller.alldailySpecialList[index]['day']}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.3,
                                        child: Text(controller
                                                .alldailySpecialList.isEmpty
                                            ? "•  ${controller.hour.dailySpecils?[index]['name']}"
                                            : "•  ${controller.alldailySpecialList[index]['name']}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.24,
                                        child: Text(controller
                                                .alldailySpecialList.isEmpty
                                            ? "•  ${controller.hour.dailySpecils?[index]['price']}"
                                            : "•  ${controller.alldailySpecialList[index]['price']}"),
                                      ),
                                      SizedBox(
                                        width: W * 0.1,
                                        child: Text(controller
                                                .alldailySpecialList.isEmpty
                                            ? "•  ${controller.hour.dailySpecils?[index]['quantity']}"
                                            : "•  ${controller.alldailySpecialList[index]['quantity']}"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Amenities",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editAmenitiesScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 16 / 2,
                                  crossAxisCount: 2,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.amentyAddList.isEmpty
                                    ? controller.hour.amenities?.length
                                    : controller.amentyAddList.length,
                                itemBuilder: (context, index) {
                                  return Text(controller.amentyAddList.isEmpty
                                      ? "•  ${controller.hour.amenities?[index]}"
                                      : "•  ${controller.amentyAddList[index]}");
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Bar Type",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editBarTypeScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 16 / 2,
                                  crossAxisCount: 2,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.barTypeAddList.isEmpty
                                    ? controller.hour.barType?.length
                                    : controller.barTypeAddList.length,
                                itemBuilder: (context, index) {
                                  return Text(controller.barTypeAddList.isEmpty
                                      ? "•  ${controller.hour.barType?[index]}"
                                      : "•  ${controller.barTypeAddList[index]}");
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Events",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.editEventsScreen,
                                          arguments: controller.hour);
                                    },
                                    child: Image.asset(
                                      "assets/icons/Group 11493@2x.png",
                                      height: H * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Day",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "From",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "To",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              GridView.builder(
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  //  mainAxisExtent: 1,
                                  childAspectRatio: 16 / 2,
                                  crossAxisCount: 1,
                                ),
                                shrinkWrap: true,
                                itemCount: controller.selectedEvent.isEmpty
                                    ? controller.hour.event?.length
                                    : controller.selectedEvent.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: W * 0.2,
                                        child: Text(controller
                                                .selectedEvent.isEmpty
                                            ? "•  ${controller.hour.event?[index]['name']}"
                                            : "•  ${controller.selectedEvent[index]['name']}"),
                                      ),
                                      Text(controller.selectedEvent.isEmpty
                                          ? "•  ${controller.hour.event?[index]['day']}"
                                          : "•  ${controller.selectedEvent[index]['day']}"),
                                      Text(controller.selectedEvent.isEmpty
                                          ? "•  ${controller.hour.event?[index]['fromtime']}"
                                          : "•  ${controller.selectedEvent[index]['fromtime']}"),
                                      Text(controller.selectedEvent.isEmpty
                                          ? "•  ${controller.hour.event?[index]['totime']}"
                                          : "•  ${controller.selectedEvent[index]['totime']}"),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: H * 0.09,
                          width: W,
                          child: CustomElevatedButtonWidget(
                            onPressed: () {
                              controller.updateBusinessHourToFireStore();
                            },
                            text: "Done",
                            textColor: blackColor,
                            fontSize: 24,
                            verticalPadding: 0,
                            borderRadius: 45,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
