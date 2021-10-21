import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/details/details.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class Pricing extends StatelessWidget {
  const Pricing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: backGroundColor,
          body: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // Get.to(MessageScreen());
                      // Get.to(() => DetailsPage());
                    },
                    child: Container(
                        height: 0.7.sh,
                        width: 0.5.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: mainColor)),
                        padding: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.rotate(
                                    angle: 15,
                                    child: Container(
                                      width: 0.2.sw,
                                      height: 0.2.sw,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(color: mainColor)),
                                      child: Transform.rotate(
                                          angle: 4,
                                          child: Image.asset(PricingVector)),
                                    ),
                                  ),
                                  customText('Free', black, 18,
                                        FontWeight.w600),
                                ],
                              ),
                              SizedBox(
                                height: 0.05.sh,
                              ),
                              getRichText('\$00/', 'Month'),
                              SizedBox(
                                height: 0.02.sh,
                              ),
                              getActiveFeaturesText('Browse Profiles'),
                              getActiveFeaturesText('Browse Profiles'),
                              getActiveFeaturesText(
                                  'Shortlist & Send Interest'),
                              getActiveFeaturesText(
                                  'Message and chat with unlimited users'),
                              getInActiveFeaturesText(
                                  'View contacts of members you like'),
                              getInActiveFeaturesText(
                                  'View contacts of members you like'),
                              getInActiveFeaturesText(
                                  'View contacts of members you like'),
                              getInActiveFeaturesText(
                                  'View contacts of members you like'),
                              SizedBox(height: 0.02.sh),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 0.7.sw,
                                      height: 0.06.sh,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: mainColor,
                                      ),
                                      child: Center(
                                          child: customText(
                                              'View Plan', white, 18,FontWeight.w400)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              })),
    );
  }

  getActiveFeaturesText(text1) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: mainColor,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: customText(text1, black, 16,   FontWeight.w400)),
        ],
      ),
    );
  }

  getInActiveFeaturesText(text1) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.cancel_outlined,
            color: mainColor,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: customText(text1, lightBlack, 16,
                    FontWeight.w300)),
        ],
      ),
    );
  }

  getRichText(text1, text2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: customizeTextStyle(
            FontWeight.bold,
            0.1.sw,
            black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: customizeTextStyle(
                  FontWeight.w700,
                  0.16.sw,
                  black,
                )),
            TextSpan(
              text: text2,
              style: customizeTextStyle(
                FontWeight.w400,
                0.08.sw,
                black,
              ),
            )
          ],
        ),
        textScaleFactor: 0.5,
      ),
    );
  }
}
