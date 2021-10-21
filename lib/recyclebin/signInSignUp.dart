import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/recyclebin/login.dart';
import 'package:matrimonial/recyclebin/register/register.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/utils/trangitionRoute.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';
class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  _SignInSignUpState createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            SvgPicture.asset(rightImg),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(logo1),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.08.sw, 0.01.sh, 0.08.sw, 0),
              child: Column(
                children: [
                  customText('Get started by login or create', commonColor, 18,FontWeight.w400),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  customText(' a new account', commonColor, 18,FontWeight.w400),
                  SizedBox(
                    height: 0.07.sh,
                  ),
                  button(() {
                    Get.to(() => Register());
                  }, 'Register', mainColor, white),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  button(() {
                    Get.to(() => Login());
                  }, 'Login', Color(0xffECECEC), commonColor),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  svgButton(
                      img: google,
                      onTap: () {
                          // googleLogin();
                          },
                      text: 'Continue with Google',
                      btnColor: white,
                      textColor: commonColor,
                      borderColor: commonColor)
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(leftImg)),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => DashboardPage());
                  // Get.to(() => DashboardPage());
                },
                child: Center(child: customText('Skip', commonColor, 16,FontWeight.w400))),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  
  //google-------------------------------------------------------------------
  // Future<void> googleLogin() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     // var deviceId = await OneSignal.shared.getDeviceState();
  //     // if (deviceId == null || deviceId.userId == null) {
  //     //   await googleLogin();
  //     // }
  //     // var userId = deviceId?.userId;
  //     // showToast(userId, red);

  //     GoogleSignIn _googleSignIn = GoogleSignIn(
  //       scopes: [
  //         'email',
  //         //'https://www.googleapis.com/auth/contacts.readonly',
  //       ],
  //     );
  //     _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
  //       // showToast('sign in 1', red);
  //       await _googleSignIn.signIn();
  //       // showToast('sign in 2', red);
  //       acc!.authentication.then((GoogleSignInAuthentication auth) async {
  //         // print(acc.photoUrl);
  //         // showToast('sign in 3', red);

  //         // print('deviceId ${deviceId!.userId}');
  //         var body = {
  //           "name": acc.displayName,
  //           "email": acc.email,
  //           "acc_id": acc.id,
  //           "profile_photo": acc.photoUrl ?? 'null',
  //           // "device_id": userId,
  //         };
  //         print('body- $body');
  //         var value = await networkcallService.googleLogin(body);
  //         // showToast('sign in 5', red);
  //         if (value != null && value == true) {
  //           // showToast('${value}', red);

  //           // print('applicationState ${sharePrefereceInstance.isLogin()}');
  //           Navigator.pushReplacement(context, ScaleRoute(OnBoarding()));
  //           setState(() {
  //             isLoading = false;
  //           });
  //         } else {
  //           setState(() {
  //             isLoading = false;
  //           });
  //         }
  //         // showToast(body.toString(), red);
  //       });
  //     });
  //   } on SocketException {
  //     throw CustomError('No Internet connection 😑');
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (e is CustomError) {
  //       if (e.isNetworkError != null && (e.isNetworkError)!) {
  //         showToast(e.customMessage, red);
  //       } else {
  //         showToast(e.customMessage, red);
  //       }
  //     }
  //   }
  // }
}
