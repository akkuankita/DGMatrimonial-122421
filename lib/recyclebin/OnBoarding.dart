// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/recyclebin/signInSignUp.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
//import 'package:matrimonial/view/dashboard/dashboard.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<String> images = [onboard1, onboard2, onboard3];
  final List<String> title = ['1. Sign Up', '2. Connect', '3. Interact'];
  final List<String> subTitle = [
    'It is a long established fact that a reader will be distracted by the ',
    'It is a long established fact that a reader will be distracted by the ',
    'It is a long established fact that a reader will be distracted by the '
  ];
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffeae4),
      bottomNavigationBar: button(() {
        // Get.to(() => DashboardPage());
        Get.to(() => SignInSignUp());
      }, 'Lets Start', mainColor, white),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.05.sh,
              ),
              Container(
                height: 0.85.sh,
                child: PageView.builder(
                    onPageChanged: (page) {
                      setState(() {
                        _pageIndex = page;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (_, int i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(title[i], mainColor, 18,FontWeight.w400),
                          SizedBox(
                            height: 10,
                          ),
                          customText(subTitle[i], primaryColor, 17,FontWeight.w400),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Image.asset(images[i],
                                  fit: BoxFit.cover, width: 1.sw)),
                        ],
                      );
                    }),
              ),
              Container(
                height: 10,
                alignment: Alignment.center,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: _pageIndex == i ? red : grey,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
