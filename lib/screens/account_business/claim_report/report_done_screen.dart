import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_hour/core/colors.dart';
import 'package:happy_hour/core/constants.dart';

import '../../../global_widgets/main_button.dart';

class ClaimReportDone extends StatelessWidget {
  const ClaimReportDone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: SvgPicture.asset(
        //       "assets/icons/Group 9108.svg",
        //       height: 25,
        //       width: 25,
        //     )),
        title: const Text("Send Report"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: H * 0.02,
                ),
                Center(
                  child: Image(
                    image: const AssetImage(
                      "assets/icons/Group 8550@2x.png",
                    ),
                    height: H * 0.22,
                    width: W * 0.6,
                  ),
                ),
                SizedBox(
                  height: H * 0.03,
                ),
                const Center(
                  child: Text(
                    "Report Submitted",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: H * 0.03,
                ),
                const Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse fermentum consectetur enim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: H * 0.04,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 30.0),
        child: SizedBox(
          height: H * 0.09,
          width: W,
          child: CustomElevatedButtonWidget(
            onPressed: () {
              Get.back();
              Get.back();
            },
            text: "Done",
            textColor: blackColor,
            fontSize: 24,
            verticalPadding: 0,
            borderRadius: 45,
          ),
        ),
      ),
    );
  }
}
