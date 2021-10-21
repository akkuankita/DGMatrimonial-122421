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
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(MessageScreen());
                    },
                    child: Container(
                        height: 0.12.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 0.07.sh,
                              height: 0.07.sh,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomCashedNetworImage(
                                  imageUrl: img,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText('Name of Customer  ', black, 18,
                                          FontWeight.bold),
                                    customText('Online', colorGreenAccent, 14,
                                          FontWeight.w400),
                                  ],
                                ),
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
