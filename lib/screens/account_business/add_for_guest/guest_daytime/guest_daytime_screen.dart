import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_hour/screens/account_business/add_for_guest/guest_controller.dart';

import '../../../../core/colors.dart';
import '../../../../core/constants.dart';
import '../../../../global_controller/global_general_controller.dart';
import '../../../../global_widgets/main_button.dart';

class GuestDayTimeScreen extends GetView<GuestController> {
  const GuestDayTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                "assets/icons/Group 9108.svg",
                height: 25,
                width: 25,
              )),
          title: const Text("Add Happy Hour Hours"),
          centerTitle: true,
        ),
        body: Form(
          key: controller.businessKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: RawScrollbar(
              thumbColor: primary,
              trackColor: whiteColor,
              thumbVisibility: true,
              trackVisibility: true,
              radius: const Radius.circular(20),
              thickness: 10,
              child: ListView(
                children: [
                  SizedBox(
                    height: H * 0.009,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Happy Hour",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: H * 0.009,
                  ),
                  titleFromTo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        elevation: 5,
                        child: SizedBox(
                          height: H * 0.05,
                          width: W * 0.36,
                          child: DropdownButtonFormField<String>(
                            // validator: (value) {
                            //   if (value == null || value.trim().isEmpty) {
                            //     return 'select';
                            //   }

                            //   return null;
                            // },
                            // value: controller.hFromTime ?? "",
                            elevation: 15,
                            decoration: const InputDecoration(
                              enabled: false,
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 2.0, 8.0, 2.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              "Select Time",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: controller.timesList
                                .map((time) => DropdownMenuItem(
                                      value: time,
                                      child: Text(
                                        time,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (time) {
                              controller.hFromTime = time!;
                            },
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        elevation: 5,
                        child: SizedBox(
                          height: H * 0.05,
                          width: W * 0.36,
                          child: DropdownButtonFormField<String>(
                            // validator: (value) {
                            //   if (value == null || value.trim().isEmpty) {
                            //     return 'select';
                            //   }

                            //   return null;
                            // },
                            //value: controller.hToTime ?? "",
                            elevation: 15,
                            decoration: const InputDecoration(
                              enabled: false,
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 2.0, 8.0, 2.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              "Select Time",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: controller.timesList
                                .map((time) => DropdownMenuItem(
                                      value: time,
                                      child: Text(
                                        time,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (time) {
                              controller.hToTime = time!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => AbsorbPointer(
                        absorbing: controller.showDayList,
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[0].isSelect.value,
                                        onChanged: (val) {
                                          controller.dayTimeList[0].isSelect
                                                  .value =
                                              !controller.dayTimeList[0]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[0].isSelect.isTrue) {
                                            controller.dayTimeList[0].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[0].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(0);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "S",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[1].isSelect.value,
                                        onChanged: (val) {
                                          // controller.isTue = !controller.isTue;
                                          controller.dayTimeList[1].isSelect
                                                  .value =
                                              !controller.dayTimeList[1]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[1].isSelect.isTrue) {
                                            controller.dayTimeList[1].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[1].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(1);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "M",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[2].isSelect.value,
                                        onChanged: (val) {
                                          controller.dayTimeList[2].isSelect
                                                  .value =
                                              !controller.dayTimeList[2]
                                                  .isSelect.value;
                                          //controller.isWed = !controller.isWed;
                                          if (controller
                                              .dayTimeList[2].isSelect.isTrue) {
                                            controller.dayTimeList[2].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[2].toTime =
                                                controller.hToTime!;

                                            controller.addToHday(2);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "T",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[3].isSelect.value,
                                        onChanged: (val) {
                                          // controller.isThu = !controller.isThu;

                                          controller.dayTimeList[3].isSelect
                                                  .value =
                                              !controller.dayTimeList[3]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[3].isSelect.isTrue) {
                                            controller.dayTimeList[3].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[3].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(3);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "W",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[4].isSelect.value,
                                        onChanged: (val) {
                                          controller.dayTimeList[4].isSelect
                                                  .value =
                                              !controller.dayTimeList[4]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[4].isSelect.isTrue) {
                                            controller.dayTimeList[4].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[4].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(4);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "T",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[5].isSelect.value,
                                        onChanged: (val) {
                                          // controller.isSat = !controller.isSat;
                                          controller.dayTimeList[5].isSelect
                                                  .value =
                                              !controller.dayTimeList[5]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[5].isSelect.isTrue) {
                                            controller.dayTimeList[5].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[5].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(5);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "F",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Transform.scale(
                              scale: 0.5,
                              child: Obx(
                                () => Card(
                                  margin: const EdgeInsets.all(1),
                                  elevation: 3,
                                  shape: const StadiumBorder(),
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Checkbox(
                                        activeColor: primary,
                                        checkColor: Colors.amber,
                                        splashRadius: 20,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                        value: controller
                                            .dayTimeList[6].isSelect.value,
                                        onChanged: (val) {
                                          // controller.isSun = !controller.isSun;
                                          controller.dayTimeList[6].isSelect
                                                  .value =
                                              !controller.dayTimeList[6]
                                                  .isSelect.value;
                                          if (controller
                                              .dayTimeList[6].isSelect.isTrue) {
                                            controller.dayTimeList[6].fromTime =
                                                controller.hFromTime!;
                                            controller.dayTimeList[6].toTime =
                                                controller.hToTime!;
                                            controller.addToHday(6);
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "S",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: W * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: W * 0.3,
                      right: W * 0.34,
                    ),
                    child: CustomElevatedButtonWidget(
                      onPressed: () {
                        if (controller.hFromTime != null &&
                            controller.hToTime != null) {
                          controller.showDayList = true;
                        } else {
                          Get.find<GlobalGeneralController>().errorSnackbar(
                              title: "Time", description: "Select Time ");
                        }
                      },
                      verticalPadding: 0,
                      text: "submit",
                      textColor: blackColor,
                      fontSize: 16,
                      borderRadius: 45,
                    ),
                  ),
                  SizedBox(
                    height: H * 0.03,
                  ),
                  Obx(() => Visibility(
                        visible: controller.showDayList,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.dayTimeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: W * 0.01, right: W * 0.06),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Transform.scale(
                                          scale: 0.6,
                                          child: Obx(
                                            () => Card(
                                              margin: const EdgeInsets.all(1),
                                              elevation: 3,
                                              shape: const StadiumBorder(),
                                              child: Transform.scale(
                                                scale: 2.0,
                                                child: Checkbox(
                                                    checkColor: Colors.amber,
                                                    splashRadius: 20,
                                                    shape:
                                                        const StadiumBorder(),
                                                    side: BorderSide.none,
                                                    value: controller
                                                        .dayTimeList[index]
                                                        .isSelect
                                                        .value,
                                                    onChanged: (val) {
                                                      controller
                                                              .dayTimeList[index]
                                                              .isSelect
                                                              .value =
                                                          !controller
                                                              .dayTimeList[
                                                                  index]
                                                              .isSelect
                                                              .value;

                                                      controller
                                                          .hUpdateDay(index);
                                                      if (controller
                                                          .dayTimeList[index]
                                                          .isSelect
                                                          .isTrue) {
                                                        controller
                                                            .dayTimeList[index]
                                                            .fromTime = controller
                                                                .hFromTime ??
                                                            "";
                                                        controller
                                                            .dayTimeList[index]
                                                            .toTime = controller
                                                                .hToTime ??
                                                            "";
                                                        controller
                                                            .addToHday(index);
                                                        // controller.businessKey
                                                        //     .currentState!
                                                        //     .reset();
                                                        // controller
                                                        //     .dayTimeList[index]
                                                        //     .isEarly
                                                        //     .value = false;
                                                        // controller
                                                        //     .dayTimeList[index]
                                                        //     .isLate
                                                        //     .value = false;
                                                      } else {}
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: W * 0.24,
                                          child: Text(
                                            controller.dayTimeList[index].day,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Obx(
                                          () => Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                                            elevation: 5,
                                            child: SizedBox(
                                              height: H * 0.04,
                                              width: W * 0.26,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                validator: controller
                                                        .dayTimeList[index]
                                                        .isSelect
                                                        .isTrue
                                                    ? (value) {
                                                        if (value == null ||
                                                            value
                                                                .trim()
                                                                .isEmpty) {
                                                          return 'select';
                                                        }

                                                        return null;
                                                      }
                                                    : null,
                                                value:
                                                    controller.hFromTime ?? "",
                                                elevation: 15,
                                                decoration:
                                                    const InputDecoration(
                                                  enabled: false,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 2.0, 8.0, 2.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                45)),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: controller
                                                        .dayTimeList[index]
                                                        .isSelect
                                                        .isTrue
                                                    ? controller.timesList
                                                        .map((time) =>
                                                            DropdownMenuItem(
                                                              value: time,
                                                              child: Text(
                                                                time,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList()
                                                    : [],
                                                onChanged: (time) {
                                                  controller.dayTimeList[index]
                                                      .fromTime = time!;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                                            elevation: 5,
                                            child: SizedBox(
                                              height: H * 0.04,
                                              width: W * 0.26,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                value: controller.hToTime ?? "",
                                                validator: controller
                                                        .dayTimeList[index]
                                                        .isSelect
                                                        .isTrue
                                                    ? (value) {
                                                        if (value == null ||
                                                            value
                                                                .trim()
                                                                .isEmpty) {
                                                          return 'select';
                                                        }

                                                        return null;
                                                      }
                                                    : null,
                                                elevation: 15,
                                                decoration:
                                                    const InputDecoration(
                                                  enabled: false,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 2.0, 8.0, 2.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                45)),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: controller
                                                        .dayTimeList[index]
                                                        .isSelect
                                                        .isTrue
                                                    ? controller.timesList
                                                        .map((time) =>
                                                            DropdownMenuItem(
                                                              value: time,
                                                              child: Text(
                                                                time,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList()
                                                    : [],
                                                onChanged: (time) {
                                                  controller.dayTimeList[index]
                                                      .toTime = time!;
                                                  controller.hDayTime(index);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                  SizedBox(
                    height: H * 0.04,
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     "Add Late Happy Hour Details",
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.showLate = !controller.showLate;
                    },
                    child: const Center(
                      child: Text(
                        "+ Add late Happy Hour",
                        style: TextStyle(
                          fontSize: 26,
                          color: primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.showLate,
                      child: Column(
                        children: [
                          SizedBox(
                            height: H * 0.009,
                          ),
                          titleFromTo(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                elevation: 5,
                                child: SizedBox(
                                  height: H * 0.05,
                                  width: W * 0.36,
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'select';
                                      }

                                      return null;
                                    },
                                    // value: controller.hFromTime2 ?? "",
                                    elevation: 15,
                                    decoration: const InputDecoration(
                                      enabled: false,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          12.0, 2.0, 8.0, 2.0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(45)),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      "Select Time",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: controller.timesList
                                        .map((time) => DropdownMenuItem(
                                              value: time,
                                              child: Text(
                                                time,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (time) {
                                      controller.hFromTime2 = time!;
                                    },
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                elevation: 5,
                                child: SizedBox(
                                  height: H * 0.05,
                                  width: W * 0.36,
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'select';
                                      }

                                      return null;
                                    },
                                    // value: controller.hToTime2 ?? "",
                                    elevation: 15,
                                    decoration: const InputDecoration(
                                      enabled: false,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          12.0, 2.0, 8.0, 2.0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(45)),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      "Select Time",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: controller.timesList
                                        .map((time) => DropdownMenuItem(
                                              value: time,
                                              child: Text(
                                                time,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (time) {
                                      controller.hToTime2 = time!;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => AbsorbPointer(
                              absorbing: controller.showLateDayList,
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[0].isLate.value,
                                              onChanged: (val) {
                                                // controller.isSun = !controller.isSun;
                                                controller.dayTimeList[0].isLate
                                                        .value =
                                                    !controller.dayTimeList[0]
                                                        .isLate.value;
                                                if (controller.dayTimeList[0]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[0]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[0]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(0);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "S",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[1].isLate.value,
                                              onChanged: (val) {
                                                controller.dayTimeList[1].isLate
                                                        .value =
                                                    !controller.dayTimeList[1]
                                                        .isLate.value;
                                                if (controller.dayTimeList[1]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[1]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[1]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(1);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "M",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[2].isLate.value,
                                              onChanged: (val) {
                                                // controller.isTue = !controller.isTue;
                                                controller.dayTimeList[2].isLate
                                                        .value =
                                                    !controller.dayTimeList[2]
                                                        .isLate.value;
                                                if (controller.dayTimeList[2]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[2]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[2]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(2);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "T",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[3].isLate.value,
                                              onChanged: (val) {
                                                controller.dayTimeList[3].isLate
                                                        .value =
                                                    !controller.dayTimeList[3]
                                                        .isLate.value;
                                                if (controller.dayTimeList[3]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[3]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[3]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(3);
                                                }

                                                //controller.isWed = !controller.isWed;
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "W",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[4].isLate.value,
                                              onChanged: (val) {
                                                // controller.isThu = !controller.isThu;

                                                controller.dayTimeList[4].isLate
                                                        .value =
                                                    !controller.dayTimeList[4]
                                                        .isLate.value;
                                                if (controller.dayTimeList[4]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[4]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[4]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(4);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "T",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[5].isLate.value,
                                              onChanged: (val) {
                                                controller.dayTimeList[5].isLate
                                                        .value =
                                                    !controller.dayTimeList[5]
                                                        .isLate.value;
                                                if (controller.dayTimeList[5]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[5]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[5]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(5);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "F",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Transform.scale(
                                    scale: 0.5,
                                    child: Obx(
                                      () => Card(
                                        margin: const EdgeInsets.all(1),
                                        elevation: 3,
                                        shape: const StadiumBorder(),
                                        child: Transform.scale(
                                          scale: 2.0,
                                          child: Checkbox(
                                              activeColor: primary,
                                              checkColor: Colors.amber,
                                              splashRadius: 20,
                                              shape: const StadiumBorder(),
                                              side: BorderSide.none,
                                              value: controller
                                                  .dayTimeList[6].isLate.value,
                                              onChanged: (val) {
                                                // controller.isSat = !controller.isSat;
                                                controller.dayTimeList[6].isLate
                                                        .value =
                                                    !controller.dayTimeList[6]
                                                        .isLate.value;
                                                if (controller.dayTimeList[6]
                                                    .isLate.isTrue) {
                                                  controller.dayTimeList[6]
                                                          .fromTime2 =
                                                      controller.hFromTime2!;
                                                  controller.dayTimeList[6]
                                                          .toTime2 =
                                                      controller.hToTime2!;
                                                  controller.addToHdaySecond(6);
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "S",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomElevatedButtonWidget(
                            onPressed: () {
                              if (controller.hFromTime2 != null &&
                                  controller.hToTime2 != null) {
                                controller.showLateDayList = true;
                                controller.showDayList = true;
                                controller.showLateDayList = true;
                              } else {
                                Get.find<GlobalGeneralController>()
                                    .errorSnackbar(
                                        title: "Time",
                                        description: "Select Time ");
                              }
                            },
                            horizontalPadding: 40,
                            verticalPadding: 0,
                            text: "submit",
                            textColor: blackColor,
                            fontSize: 16,
                            borderRadius: 45,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() => Visibility(
                        visible: controller.showLateDayList,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.dayTimeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: W * 0.01, right: W * 0.06),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Transform.scale(
                                          scale: 0.6,
                                          child: Obx(
                                            () => Card(
                                              margin: const EdgeInsets.all(1),
                                              elevation: 3,
                                              shape: const StadiumBorder(),
                                              child: Transform.scale(
                                                scale: 2.0,
                                                child: Checkbox(
                                                    checkColor: Colors.amber,
                                                    splashRadius: 20,
                                                    shape:
                                                        const StadiumBorder(),
                                                    side: BorderSide.none,
                                                    value: controller
                                                        .dayTimeList[index]
                                                        .isLate
                                                        .value,
                                                    onChanged: (val) {
                                                      controller
                                                              .dayTimeList[index]
                                                              .isLate
                                                              .value =
                                                          !controller
                                                              .dayTimeList[
                                                                  index]
                                                              .isLate
                                                              .value;
                                                      controller
                                                          .hUpdateDaySecond(
                                                              index);
                                                      if (controller
                                                          .dayTimeList[index]
                                                          .isLate
                                                          .isTrue) {
                                                        controller
                                                            .dayTimeList[index]
                                                            .fromTime = controller
                                                                .hFromTime ??
                                                            "";
                                                        controller
                                                            .dayTimeList[index]
                                                            .toTime = controller
                                                                .hToTime ??
                                                            "";
                                                        controller
                                                            .addToHdaySecond(
                                                                index);
                                                      }
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: W * 0.24,
                                          child: Text(
                                            controller.dayTimeList[index].day,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Obx(
                                          () => Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                                            elevation: 5,
                                            child: SizedBox(
                                              height: H * 0.04,
                                              width: W * 0.26,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                validator: controller
                                                        .dayTimeList[index]
                                                        .isLate
                                                        .isTrue
                                                    ? (value) {
                                                        if (value == null ||
                                                            value
                                                                .trim()
                                                                .isEmpty) {
                                                          return 'select';
                                                        }

                                                        return null;
                                                      }
                                                    : null,
                                                value: controller.hFromTime2,
                                                elevation: 15,
                                                decoration:
                                                    const InputDecoration(
                                                  enabled: false,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 2.0, 8.0, 2.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                45)),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: controller
                                                        .dayTimeList[index]
                                                        .isLate
                                                        .isTrue
                                                    ? controller.timesList
                                                        .map((time) =>
                                                            DropdownMenuItem(
                                                              value: time,
                                                              child: Text(
                                                                time,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList()
                                                    : [],
                                                onChanged: (time) {
                                                  controller.dayTimeList[index]
                                                      .fromTime2 = time!;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                                            elevation: 5,
                                            child: SizedBox(
                                              height: H * 0.04,
                                              width: W * 0.26,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                value: controller.hToTime2,
                                                validator: controller
                                                        .dayTimeList[index]
                                                        .isLate
                                                        .isTrue
                                                    ? (value) {
                                                        if (value == null ||
                                                            value
                                                                .trim()
                                                                .isEmpty) {
                                                          return 'select';
                                                        }

                                                        return null;
                                                      }
                                                    : null,
                                                elevation: 15,
                                                decoration:
                                                    const InputDecoration(
                                                  enabled: false,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          12.0, 2.0, 8.0, 2.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                45)),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: controller
                                                        .dayTimeList[index]
                                                        .isLate
                                                        .isTrue
                                                    ? controller.timesList
                                                        .map((time) =>
                                                            DropdownMenuItem(
                                                              value: time,
                                                              child: Text(
                                                                time,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList()
                                                    : [],
                                                onChanged: (time) {
                                                  controller.dayTimeList[index]
                                                      .toTime2 = time!;
                                                  controller
                                                      .hDayTimeSecond(index);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 32),
          child: SizedBox(
            height: H * 0.09,
            child: CustomElevatedButtonWidget(
              onPressed: () {
                controller.onDayTimeNextTap();
              },
              verticalPadding: 0,
              text: "Next",
              textColor: blackColor,
              fontSize: 24,
              borderRadius: 45,
            ),
          ),
        ),
      );
    });
  }

  Row titleFromTo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text(
          "From",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "To",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
