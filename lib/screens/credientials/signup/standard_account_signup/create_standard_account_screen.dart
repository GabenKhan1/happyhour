import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:happy_hour/core/colors.dart';
import 'package:happy_hour/core/constants.dart';
import 'package:happy_hour/global_widgets/main_button.dart';
import 'package:happy_hour/global_widgets/text_field.dart';
import 'package:happy_hour/screens/credientials/signup/standard_account_signup/standard_account_signup_controller.dart';

import '../../../../global_widgets/circular_indicator.dart';

class CreateStandardAccountScreen extends GetView<StandardAccountController> {
  const CreateStandardAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomCircleIndicator(
        opacity: 0.5,
        isEnabled: controller.isLoading,
        child: Scaffold(
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
              ),
            ),
            title: const Text("Standard Account"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: controller.formGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: H * 0.009,
                    ),
                    Center(
                      child: Image(
                        image: const AssetImage(
                          "assets/icons/Group 11411@2x.png",
                        ),
                        height: H * 0.25,
                        width: W * 0.6,
                      ),
                    ),
                    const Text(
                      "Please Enter the Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: H * 0.02,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Name",
                      textEditingController: controller.nameFieldController,
                      validator: controller.validateName,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/icons/Group 10993@2x.png",
                          height: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: H * 0.02,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Email",
                      textEditingController: controller.emailFieldController,
                      validator: controller.validateEmail,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/icons/Group 10999.png",
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: H * 0.02,
                    ),
                    Obx(
                      () => CustomTextFieldWidget(
                        hintText: "Password",
                        textEditingController:
                            controller.passwordFieldController,
                        validator: controller.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.obscurePassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.onShowPasswordTap();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: controller.obscurePassword
                                ? Image.asset(
                                    "assets/icons/Component Icon Hide.png",
                                    height: 25,
                                    width: 30,
                                  )
                                : Image.asset(
                                    "assets/icons/Group 11609.png",
                                    height: 25,
                                    width: 25,
                                  ),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            "assets/icons/Icon material-lock-outline.png",
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: H * 0.02,
                    ),
                    Obx(
                      () => CustomTextFieldWidget(
                        hintText: "Confirm Password",
                        textEditingController:
                            controller.confirmPasswordController,
                        validator: controller.validateConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.obscureConfirmPassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.onShowConfirmPasswordTap();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: controller.obscureConfirmPassword
                                ? Image.asset(
                                    "assets/icons/Component Icon Hide.png",
                                    height: 25,
                                    width: 30,
                                  )
                                : Image.asset(
                                    "assets/icons/Group 11609.png",
                                    height: 25,
                                    width: 25,
                                  ),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            "assets/icons/Icon material-lock-outline.png",
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: H * 0.08,
                    ),
                    Center(
                      child: SizedBox(
                        height: H * 0.073,
                        width: W,
                        child: CustomElevatedButtonWidget(
                          onPressed: () {
                            controller.validateForm();
                          },
                          text: "Sign Up",
                          textColor: blackColor,
                          fontSize: 24,
                          verticalPadding: 0,
                          borderRadius: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
