import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/StartScreen.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  List<Map<String, String>> sliderData = [
    {
      "maintitle": "Sign Up",
      "image": 'assets/images/onboard1.png',
      "subtitile":
          "It is a long established fact that \na reader will be distracted by the ",
    },
    {
      "maintitle": "Connect",
      "image": 'assets/images/onboard2.png',
      "subtitile":
          "It is a long established fact that \na rea  der will be distracted by the ",
    },
    {
      "maintitle": "Interact",
      "image": 'assets/images/onboard3.png',
      "subtitile":
          "It is a long established fact that \na reader will be distracted by the ",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD7B7),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                child: SizedBox(
                  child: PageView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: sliderData.length,
                    itemBuilder: (context, index) => SliderContent(
                      maintitle: sliderData[index]["maintitle"]!,
                      image: sliderData[index]["image"]!,
                      subtitile: sliderData[index]["subtitile"]!,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  //  color: Color.fromRGBO(255, 255, 255, 0.34),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                    child: SizedBox(
                      width: 1.sw,
                      height: 44.h,
                      child: DefaultButton(
                        text: "Lets Start",
                        press: () {
                          Get.to(() => StartScreen());
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 90.h, left: 20.w),
                  child: Row(
                    children: List.generate(
                      sliderData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot({int? index}) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      height: 6.h,
      width: 6.w,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(3.r),
      ),
    );
  }
}

class SliderContent extends StatelessWidget {
  final String maintitle, image, subtitile;
  const SliderContent({
    Key? key,
    required this.maintitle,
    required this.image,
    required this.subtitile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(maintitle, kSecColor, 22.sp, FontWeight.w700),
                SizedBox(height: 12.h),
                customText(subtitile, kSecColor, 16.sp, FontWeight.w400),
                SizedBox(height: 43.h),
                Image.asset(image, fit: BoxFit.contain),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
