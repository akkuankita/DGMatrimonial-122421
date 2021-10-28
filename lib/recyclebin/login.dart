import 'package:flutter/material.dart';
import 'package:matrimonial/recyclebin/SigninSignUpWidget.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';
//import 'package:matrimonial/view/dashboard/search/search_result.dart';
//import 'package:matrimonial/view/dashboard/widget/circularLodar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          title: Text('Log In'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey2,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    logInSection(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  /// logInSection -------------------------------
  logInSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Container(
            width: 0.9.sw,
            height: 0.06.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backGroundColor,
            ),
            child: SigninSignUpWidget().customTextField(
                height: 1.sh,
                icon: Icons.account_circle_outlined,
                hintText: 'Email Id',
                controller: emailController,
                color: black,
                borderColor: black,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Email Id ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Email Id ";
                  }
                }),
          ),
        ),
        SigninSignUpWidget().getHeightSizedBox(1.sh * 0.03),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Container(
            width: 0.9.sw,
            height: 0.06.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backGroundColor,
            ),
            child: SigninSignUpWidget().customTextField(
                height: 1.sh,
                icon: Icons.account_circle_outlined,
                hintText: 'Password',
                controller: passwordController,
                color: black,
                borderColor: black,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Password ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Password ";
                  }
                }),
          ),
        ),
        SigninSignUpWidget().getHeightSizedBox(1.sh * 0.03),
        customText('Forgot Password?', mainColor, 16,FontWeight.w400),
        SizedBox(height: 0.05.sh),
        InkWell(
          onTap: () {
            Get.to(() => DashboardPage());
          },
          child: Container(
            width: 0.7.sw,
            height: 0.06.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainColor,
            ),
            child: Center(child: customText('Log In', white, 18,FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}
