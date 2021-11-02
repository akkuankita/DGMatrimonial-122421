import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/dashboard/chat/MessageScreen.dart';
import 'package:matrimonial/view/dashboard/search/adv_search.dart';
import 'package:matrimonial/view/dashboard/search/search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class MemberChat extends StatefulWidget {
  const MemberChat({Key? key}) : super(key: key);

  @override
  _MemberChatState createState() => _MemberChatState();
}

class _MemberChatState extends State<MemberChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(MessageScreen());
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 48.h,
                              height: 48.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomCashedNetworImage(
                                  imageUrl: img,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('Name of Customer  ', black, 14.sp,
                                      FontWeight.bold),
                                  SizedBox(height: 4.h),
                                  customText('Online', colorGreenAccent, 14,
                                      FontWeight.w400),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              })),
    );
  }
}
