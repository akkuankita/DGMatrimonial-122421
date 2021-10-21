import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/BottomTab/MyTabBar.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _passwod = TextEditingController();
  bool _isShowPassword = false;

  @override
  void dispose() {
    _email.dispose();
    _passwod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThirdColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: customText("Login", white, 16.sp, FontWeight.w700),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Image.asset("assets/images/logo.png", width: 300.w),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter email address';
                    } else if (!value.trim().isEmail) {
                      return 'Please enter valid email address';
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.@]'))
                  ],
                  decoration: myInputDecoration(hintText: 'E-mail Address'),
                ),
                SizedBox(height: 22.h),
                TextFormField(
                  controller: _passwod,
                  obscureText: !_isShowPassword,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter password';
                    }
                  },
                  decoration: myInputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isShowPassword = !_isShowPassword;
                        });
                      },
                      icon: Icon(_isShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 1.sw,
                  height: 48,
                  child: DefaultButton(
                    text: "Login",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    // press: () {
                    //   Get.to(() => MyTabBar());
                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _login() async {
    bool result = await networkcallService.login(
      email: _email.text,
      password: _passwod.text,
    );

    if (result) {
      // if (widget.userType == 'patient') {
      Get.offAll(() => MyTabBar());
      // } else {
      //   showSnack('Under processing');
      // }
    }
  }
}

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   String _selectedValue = 'A';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           DropdownButton(
//               value: _selectedValue,
//               isExpanded: true,

//               onChanged: (value) {
//                 setState(() {
//                   _selectedValue = value as String;
//                 });
//               },
//               items: [
//                 DropdownMenuItem(
//                   child: Text('A'),
//                   value: 'A',
//                 ),
//                 DropdownMenuItem(child: Text('B'), value: 'B'),
//                 DropdownMenuItem(
//                   child: Text('C'),
//                   value: 'C',
//                 )
//               ])
//         ],
//       )),
//     );
//   }
// }
