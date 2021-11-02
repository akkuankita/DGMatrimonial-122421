import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/dashboard/chat/MessageScreen.dart';
import 'package:matrimonial/view/dashboard/search/adv_search.dart';
import 'package:matrimonial/view/dashboard/search/search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class MyChat extends StatefulWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Get.to(MessageScreen());
            },
            child: Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                customText('Name of Customer  ', black, 14.sp,
                                    FontWeight.w700),
                                SizedBox(height: 4.h),
                                Container(
                                  width: 26.w,
                                  height: 21.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: mainColor,
                                  ),
                                  child: Center(
                                    child: customText(
                                        '2', white, 13.sp, FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            customText('It is a long established fact a... ',
                                mainColor, 12.sp, FontWeight.w400),
                          ],
                        ),
                        Container(
                          width: 0.06.sh,
                          height: 0.06.sh,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomCashedNetworImage(
                              imageUrl: img,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    customText('Online', colorGreenAccent, 14, FontWeight.w400),
                  ],
                )),
          );
        });
  }
}
