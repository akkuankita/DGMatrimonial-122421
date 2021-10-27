import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/Controller/application_starter_controller.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';
import 'package:matrimonial/view/SigninSignUp/LoginScreen.dart';
import 'package:matrimonial/view/SigninSignUp/MorepersonalDetail.dart';
import 'package:matrimonial/view/SigninSignUp/PersonalDetails.dart';
import 'package:matrimonial/view/SigninSignUp/ProfessionalDetails.dart';
import 'package:matrimonial/view/SigninSignUp/RegisterScreen.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/OnBoarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: lightBlackBoldColor));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // print('main check');
  await sharePrefereceInstance.init();
  runApp(
    StartApp(),
  );
}

class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    // String token = 'Bearer ${sharePrefereceInstance.getToken()}';
    // print(token);
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  var returnWidget1 = SplashScreen();
  final applicationStarterController = Get.put(ApplicationStarterController());
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      allowFontScaling: false,
      designSize: Size(w, h),
      builder: () => Obx(() {
        // print('obx');
        var applicationState = applicationStarterController.state.value;
        // return returnWidget1;
        // return DashBoard();
        // print('applicationState ${applicationState}');
        if (applicationState == ApplicationState.LoggedIn) {
          return RegisterScreen();
        } else if (applicationState == ApplicationState.LoggedOut) {
          return ProfessionalDetails();
        } else {
          return returnWidget1;
        }
      }),
    );
  }
}

//
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
