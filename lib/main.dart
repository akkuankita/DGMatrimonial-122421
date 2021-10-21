import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/OnBoarding.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      allowFontScaling: false,
      designSize: Size(w, h),
      builder: () => SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      // Get.to(() => AdvSearch());
      // Get.to(() => MainChatPage());
      // Get.to(() => MessageScreen());
      // Get.to(() => DetailsPage());
      // Get.to(() => SavePage());
      // Get.to(() => MorePersonalDetailsRegister());
      // Get.to(() => PersonalDetailsRegister());
      // Get.to(() => Pricing());
      // Get.to(() => Register());
      Get.to(() => OnBoarding());
      // Get.to(() => iPhone12ProMax1());
      // Get.to(() => SignInSignUp());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(rightImg),
            Center(
              child: Image.asset(logo1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(leftImg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
