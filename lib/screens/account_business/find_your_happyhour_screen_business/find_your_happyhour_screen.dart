import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:happy_hour/core/colors.dart';
import 'package:happy_hour/core/constants.dart';
import 'package:happy_hour/global_widgets/happyhour_card.dart';

import '../../../routes/app_routes.dart';
import 'find_your_happyhour_screen_controller.dart';

class BusinessFindYourHappyHourScreen
    extends GetView<BusinessFindYourHappyHourScreenController> {
  const BusinessFindYourHappyHourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                "assets/icons/Group 9108.svg",
                height: 25,
                width: 25,
              ),
            )),
        title: const Text(
          "Happy Hour",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.businessFilterScreen);
              },
              child: CircleAvatar(
                radius: 23,
                backgroundColor: primary,
                child: SvgPicture.asset(
                  "assets/icons/Group 4822.svg",
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "All Search Result",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    child: Chip(
                      padding: const EdgeInsets.all(12),
                      avatar: Image.asset(
                        "assets/icons/Group 3809.png",
                      ),
                      label: const Text("View Map"),
                      backgroundColor: whiteColor,
                      elevation: 5,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.mapScreen,
                          arguments: controller.hoursInRadiusList);
                    },
                  ),
                ],
              ),
              SizedBox(height: H * 0.005),
              // const Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Text(
              //     "Electronics",
              //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              //   ),
              // ),
              SizedBox(height: H * 0.009),
              //*Hour In 10 Miles Radius
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListView.builder(
                      itemCount: controller.hoursInRadiusList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index % 4 == 3) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () => controller.onDirectionTap(
                                    "https://www.google.com/ads"),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      "assets/icons/Group 11527.png"),
                                ),
                              ),
                              SizedBox(
                                height: H * 0.012,
                              ),
                              CustomHappyhourCard(
                                title: controller
                                    .hoursInRadiusList[index].businessName
                                    .toString(),
                                image: controller
                                    .hoursInRadiusList[index].menuImage
                                    .toString(),
                                subtitle: controller
                                    .hoursInRadiusList[index].businessAddress
                                    .toString(),
                                timeIcon: "assets/icons/Group 11432.svg",
                                time:
                                    "${controller.hoursInRadiusList[index].day?[0]['HfromTime']}  - "
                                    "${controller.hoursInRadiusList[index].day?[0]['HtoTime']}",
                                //"${DateTime.parse("2202-11-01 " + controller.hoursInRadiusList[index].day?[0]['HfromTime'].split(' ')[0])}",
                                rating: RatingBarIndicator(
                                  unratedColor: Colors.grey.shade300,
                                  direction: Axis.horizontal,
                                  rating: 0,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, index) => Image.asset(
                                    "assets/icons/Path 602@2x.png",
                                    height: 7,
                                    width: 10,
                                    color: primary,
                                  ),
                                ),
                                rateCount: controller.hoursInRadiusList[index]
                                        .reviewStar?.length
                                        .toString() ??
                                    "",
                                arrowImage: InkWell(
                                  onTap: () {
                                    controller.onDirectionTap(
                                        "https://www.google.com/maps/search/?api=1&query=${controller.hoursInRadiusList[index].latitude},${controller.hoursInRadiusList[index].longitude}");
                                  },
                                  child: Image.asset(
                                    "assets/icons/Direction.png",
                                    height: 60,
                                    //color: whiteColor,
                                  ),
                                ),
                                ontap: () {
                                  controller.viewCount(
                                      controller.hoursInRadiusList[index].hid);
                                  //  print(controller.hoursInRadiusList[index].hid);

                                  Get.toNamed(
                                      Routes.businessHappyHourDetailScreen,
                                      arguments:
                                          controller.hoursInRadiusList[index]);
                                },
                              ),
                            ],
                          );
                        } else {
                          return CustomHappyhourCard(
                            title: controller
                                .hoursInRadiusList[index].businessName
                                .toString(),
                            image: controller.hoursInRadiusList[index].menuImage
                                .toString(),
                            subtitle: controller
                                .hoursInRadiusList[index].businessAddress
                                .toString(),
                            timeIcon: "assets/icons/Group 11432.svg",
                            time:
                                "${controller.hoursInRadiusList[index].day?[0]['HfromTime']}  - "
                                "${controller.hoursInRadiusList[index].day?[0]['HtoTime']}",
                            //"${DateTime.parse("2202-11-01 " + controller.hoursInRadiusList[index].day?[0]['HfromTime'].split(' ')[0])}",
                            rating: RatingBarIndicator(
                              unratedColor: Colors.grey.shade300,
                              direction: Axis.horizontal,
                              rating: 0,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, index) => Image.asset(
                                "assets/icons/Path 602@2x.png",
                                height: 7,
                                width: 10,
                                color: primary,
                              ),
                            ),
                            rateCount: controller
                                    .hoursInRadiusList[index].reviewStar?.length
                                    .toString() ??
                                "",
                            arrowImage: InkWell(
                              onTap: () {
                                controller.onDirectionTap(
                                    "https://www.google.com/maps/search/?api=1&query=${controller.hoursInRadiusList[index].latitude},${controller.hoursInRadiusList[index].longitude}");
                              },
                              child: Image.asset(
                                "assets/icons/Direction.png",
                                height: 60,
                                //color: whiteColor,
                              ),
                            ),
                            ontap: () {
                              controller.viewCount(
                                  controller.hoursInRadiusList[index].hid);
                              //  print(controller.hoursInRadiusList[index].hid);

                              Get.toNamed(Routes.businessHappyHourDetailScreen,
                                  arguments:
                                      controller.hoursInRadiusList[index]);
                            },
                          );
                        }
                      }),
                ),
              ),

              //*===============All Hours=============*//
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: FirestoreQueryBuilder<HappyHourModel>(
              //       query: AddHappyHourProvider().happyhourFetchingQuery,
              //       builder: (context, snapshot, _) {
              //         return ListView.builder(
              //           shrinkWrap: true,
              //           physics: const BouncingScrollPhysics(),
              //           itemCount: snapshot.docs.length,
              //           itemBuilder: (context, index) {
              //             if (snapshot.hasMore &&
              //                 index + 1 == snapshot.docs.length) {
              //               snapshot.fetchMore();
              //             }
              //             HappyHourModel happyHourModel =
              //                 snapshot.docs[index].data();
              //             happyHourModel.id = snapshot.docs[index].id;
              //             if (index % 4 == 3) {
              //               return Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   const SizedBox(
              //                     height: 5,
              //                   ),
              //                   GestureDetector(
              //                     onTap: () => controller.onDirectionTap(
              //                         "https://www.google.com/ads"),
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Image.asset(
              //                           "assets/icons/Group 11527.png"),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: H * 0.012,
              //                   ),
              //                   CustomHappyhourCard(
              //                     title: happyHourModel.businessName.toString(),
              //                     image: happyHourModel.menuImage.toString(),
              //                     subtitle:
              //                         happyHourModel.businessAddress.toString(),
              //                     timeIcon: "assets/icons/Group 11432.svg",
              //                     time:
              //                         "${happyHourModel.day?[0]['HfromTime']}  - "
              //                         "${happyHourModel.day?[0]['HtoTime']}",
              //                     rating: RatingBarIndicator(
              //                       unratedColor: Colors.grey.shade300,
              //                       direction: Axis.horizontal,
              //                       rating: happyHourModel.reviewStar?[0]
              //                               ["stars"] ??
              //                           0,
              //                       itemCount: 5,
              //                       itemSize: 20,
              //                       itemBuilder: (context, index) =>
              //                           Image.asset(
              //                         "assets/icons/Path 602@2x.png",
              //                         height: 7,
              //                         width: 10,
              //                         color: primary,
              //                       ),
              //                     ),
              //                     rateCount: happyHourModel.reviewStar?.length
              //                             .toString() ??
              //                         "",
              //                     // "(${happyHourModel.foodName?[index]['foodcount'].toString()})",
              //                     arrowImage: InkWell(
              //                       onTap: () {
              //                         controller.onDirectionTap(
              //                             "https://www.google.com/maps/search/?api=1&query=${happyHourModel.latitude},${happyHourModel.longitude}");
              //                       },
              //                       child: Image.asset(
              //                         "assets/icons/Direction.png",
              //                         height: 60,
              //                         //color: whiteColor,
              //                       ),
              //                     ),
              //                     ontap: () {
              //                       controller.viewCount(happyHourModel.id);
              //                       Get.toNamed(
              //                           Routes.businessHappyHourDetailScreen,
              //                           arguments: happyHourModel);
              //                     },
              //                   ),
              //                 ],
              //               );
              //             } else {
              //               return CustomHappyhourCard(
              //                 title: happyHourModel.businessName.toString(),
              //                 image: happyHourModel.menuImage.toString(),
              //                 subtitle:
              //                     happyHourModel.businessAddress.toString(),
              //                 timeIcon: "assets/icons/Group 11432.svg",
              //                 time: "${happyHourModel.day?[0]['HfromTime']}  - "
              //                     "${happyHourModel.day?[0]['HtoTime']}",
              //                 rating: RatingBarIndicator(
              //                   unratedColor: Colors.grey.shade300,
              //                   direction: Axis.horizontal,
              //                   rating:
              //                       happyHourModel.reviewStar?[0]["stars"] ?? 0,
              //                   itemCount: 5,
              //                   itemSize: 20,
              //                   itemBuilder: (context, index) => Image.asset(
              //                     "assets/icons/Path 602@2x.png",
              //                     height: 7,
              //                     width: 10,
              //                     color: primary,
              //                   ),
              //                 ),
              //                 rateCount: happyHourModel.reviewStar?.length
              //                         .toString() ??
              //                     "",
              //                 // "(${happyHourModel.foodName?[index]['foodcount'].toString()})",
              //                 arrowImage: InkWell(
              //                   onTap: () {
              //                     controller.onDirectionTap(
              //                         "https://www.google.com/maps/search/?api=1&query=${happyHourModel.latitude},${happyHourModel.longitude}");
              //                   },
              //                   child: Image.asset(
              //                     "assets/icons/Direction.png",
              //                     height: 60,
              //                     //color: whiteColor,
              //                   ),
              //                 ),
              //                 ontap: () {
              //                   controller.viewCount(happyHourModel.id);
              //                   Get.toNamed(
              //                       Routes.businessHappyHourDetailScreen,
              //                       arguments: happyHourModel);
              //                 },
              //               );
              //             }
              //           },
              //         );
              //       }),
              // ),

              SizedBox(height: H * 0.009),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.addHappyHourBusinessAccountScreen);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            "assets/icons/Group 9711.png",
            height: H * 0.2,
          ),
        ),
      ),
    );
  }
}
