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
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(MessageScreen());
                    },
                    child: Container(
                        // width: 20,
                        height: 0.12.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      customText(
                                          'Name of Customer  ', black, 18,
                                            FontWeight.bold),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: mainColor,
                                        ),
                                        child: Center(
                                          child: customText('2', white, 16,
                                                FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  customText(
                                      'It is a long established fact a... ',
                                      mainColor,
                                      14,
                                        FontWeight.w400),
                                  customText('\nOnline', colorGreenAccent, 14,
                                        FontWeight.w400),
                                ],
                              ),
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
                        )),
                  ),
                );
              })),
    );
  }
}
