import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninSignUpWidget {
  Widget customTextField({
    height,
    controller,
    hintText,
    icon,
    validationFunction,
    color,
    borderColor,
  }) {
    return TextFormField(
      controller: controller,
      validator: validationFunction,
      style: customizeTextStyle(FontWeight.w400, 0.04.sw, color),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: borderColor,
          size: 0.06.sw,
        ),
        hintText: hintText,
        // labelText: hintText,
        // labelStyle: customizeTextStyle(FontWeight.w500, 0.04.sw, borderColor),
        hintStyle: customizeTextStyle(FontWeight.w500, 0.04.sw, borderColor),
        contentPadding: EdgeInsets.all(15),
        border: InputBorder.none,
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: borderColor),
        // ),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: borderColor),
        // ),
      ),
    );
  }

  Widget getHeightSizedBox(height) {
    return SizedBox(
      height: height,
    );
  }

  Widget getWidthSizedBox(width) {
    return SizedBox(
      width: width,
    );
  }
}
