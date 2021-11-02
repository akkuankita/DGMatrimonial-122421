import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/const.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ColoredBox(
              color: Color(0xFFF8F8F8),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    Container(
                      width: 96.0,
                      height: 96.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                        shape: BoxShape.circle,
                        color: white,
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    customText("Customer Name ", kPrimaryColor, 24.sp,
                        FontWeight.w700),
                    SizedBox(height: 8.h),
                    customText("xyz@gmail.com", Color(0xFF090927), 14.sp,
                        FontWeight.w400),
                    SizedBox(height: 16.h),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: 100.w,
                    //     height: 32.h,
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(25.r),
                    //       color: kPrimaryColor,
                    //     ),
                    //     child: customText(
                    //         "Edit Profile", white, 13.sp, FontWeight.w400),
                    //   ),
                    // )
                    SizedBox(height: 45.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
              child: Column(
                children: [
                  ProfileList(text: "Profile", press: () {}),
                  ProfileList(text: "Partner Preference", press: () {}),
                  ProfileList(text: "Membership plan", press: () {}),
                  ProfileList(text: "Log Out", press: () {}),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ProfileList extends StatelessWidget {
  final String text;

  final void Function() press;
  const ProfileList({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.h),
      padding: EdgeInsets.only(bottom: 22.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE3E3E3),
            width: 1.0,
          ),
        ),
      ),
      child: InkWell(
        onTap: press,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(text, Color(0xFF000000), 16.sp, FontWeight.w500),
            Container(
              width: 27.w,
              height: 27.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: Color(0xFFECECEC),
              ),
              child:
                  Icon(Icons.arrow_forward_ios, size: 14, color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
