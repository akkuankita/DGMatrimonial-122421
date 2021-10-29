import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';
import 'package:matrimonial/view/BottomTab/MyTabBar.dart';
import 'package:matrimonial/view/SigninSignUp/MorepersonalDetail.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';

class AboutyourSelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kThirdColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: customText("Register", white, 16.sp, FontWeight.w700),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    child: Stack(
                      children: [
                        Container(
                          width: 1.sw,
                          height: 120.h,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.symmetric(vertical: 22.h),
                          decoration: BoxDecoration(
                            color: kThirdColor,
                          ),
                          child: Column(
                            children: [
                              customText("Get started with your profile", white,
                                  20.sp, FontWeight.w700),
                            ],
                          ),
                        ),
                        PartOne(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PartOne extends StatelessWidget {
  const PartOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Blackbox(text: "1"),
                    Blackbox(text: "2"),
                    Blackbox(text: "3"),
                    Blackbox(text: "4"),
                    Blackbox(text: "5"),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                  child: AboutSelf(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutSelf extends StatefulWidget {
  const AboutSelf({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutSelf> createState() => _AboutSelfState();
}

class _AboutSelfState extends State<AboutSelf> {
  final _AboutyourselfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            customText("About Yourself", kThirdColor, 16.sp, FontWeight.w700),
            SizedBox(height: 25.h),
            customText("Write about yourself in minimum of 60 words",
                Color(0xFF707070), 14.sp, FontWeight.w400),
            SizedBox(height: 25.h),
            TextFormField(
              controller: _AboutyourselfController,
                maxLines: 5,
                maxLength: 60,
                decoration: myInputDecoration(hintText: 'About yourself')),
            SizedBox(height: 35.h),
            SizedBox(
                width: 1.sw,
                height: 50.h,
                child: DefaultButton(
                    text: "Finish",
                    press: () {
                      sendDataToApi();
                    })),
            SizedBox(height: 25.h),
            SizedBox(
                width: 1.sw,
                height: 50.h,
                child: GreyButton(
                    text: "Back",
                    press: () {
                      Get.back();
                    })),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  void sendDataToApi() async {
    try {
      var userId = sharePrefereceInstance.getuserId();
      // if (userId != null) {
      final body = {
        "Id": "$userId",
        "AboutYourself": "${_AboutyourselfController.text}",
        "OnTable": "REG5",
      };
      // print(body);
      var result = await networkcallService.register(body: body, registerNo: 5);
      if (result) {
        Get.to(() => DashboardPage());
      }
    } catch (e) {
      if (e is CustomError) {
        if (e.isNetworkError != null && (e.isNetworkError)!) {
          showSnack(e.customMessage);
        } else {
          showSnack(e.customMessage);
        }
      }
    }
  }
}
