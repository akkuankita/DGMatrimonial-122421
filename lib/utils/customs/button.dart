import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

Widget button(
        Function()? onPressed, String text, Color btnColor, Color textColor) =>
    SizedBox(
      height: 0.06.sh,
      width: 1.sw,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: btnColor,
            onPrimary: textColor,
            side: BorderSide(
              // width: 5.0,
              color: white,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: customText(text, textColor, 18, FontWeight.w300),
      ),
    );

Widget shortButton(
        Function()? onPressed, String text, Color btnColor, Color textColor) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: btnColor,
          onPrimary: textColor,
          side: BorderSide(
            // width: 5.0,
            color: white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: customText(text, textColor, 18,  FontWeight.bold),
    );

Widget iconButton(Function()? onPressed, Widget icon, Color iconColor) =>
    SizedBox(
      height: 0.06.sh,
      width: 1.sw,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: iconColor,
      ),
    );

Widget textIconButton(
    {required IconData icon,
    required Function()? onTap,
    required String text,
    required Color btnColor,
    required Color textColor}) {
  return SizedBox(
    height: 0.06.sh,
    width: 1.sw,
    child: InkWell(
      onTap: onTap,
      child: ColoredBox(
        color: btnColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: white,
            ),
            customText(text, textColor, 15,FontWeight.bold),
          ],
        ),
      ),
    ),
  );
}

Widget svgButton(
    {required String img,
    required Function()? onTap,
    required String text,
    required Color btnColor,
    required Color textColor,
    required Color borderColor}) {
  return SizedBox(
    height: 0.06.sh,
    width: 1.sw,
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: ColoredBox(
          color: btnColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(img),
              SizedBox(
                width: 20,
              ),
              customText(text, textColor, 15,FontWeight.bold),
            ],
          ),
        ),
      ),
    ),
  );
}
