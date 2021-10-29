import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/PersonalDetails.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class WhiteBox extends StatelessWidget {
  const WhiteBox({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
            )
          ],
          border: Border.all(color: white)),
      child: customText(text, kThirdColor, 16.sp, FontWeight.w700),
    );
  }
}

class Blackbox extends StatelessWidget {
  String text;
  Blackbox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF090927),
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: white)),
      child: customText(text, white, 16.sp, FontWeight.w700),
    );
  }
}
