import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => OnBoarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset("assets/images/logo.png"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset("assets/images/right_side.svg"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("assets/images/left_side.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
