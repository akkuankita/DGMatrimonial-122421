import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    customText('Filter', Colors.black, 19.sp, FontWeight.w700),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
