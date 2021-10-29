import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/BottomTab/MyTabBar.dart';
import 'package:matrimonial/view/SigninSignUp/LoginScreen.dart';
import 'package:matrimonial/view/SigninSignUp/RegisterScreen.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/OnBoarding.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", width: 300.w),
                SizedBox(height: 44.h),
                customText("Get started by login or create \na new account",
                    kSecColor, 20.sp, FontWeight.w700),
                SizedBox(height: 34.h),
                SizedBox(
                    width: 1.sw,
                    height: 50.h,
                    child: DefaultButton(
                        text: "Register",
                        press: () {
                          Get.to(() => RegisterScreen());
                        })),
                SizedBox(height: 25.h),
                SizedBox(
                    width: 1.sw,
                    height: 50.h,
                    child: BlueButton(
                        text: "Log In",
                        press: () {
                          Get.to(() => LoginScreen());
                        })),
                SizedBox(height: 35.h),
                InkWell(
                    onTap: () {
                      Get.to(() => DashboardPage());
                    },
                    child:
                        customText(" Skip", kSecColor, 16.sp, FontWeight.w700)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
