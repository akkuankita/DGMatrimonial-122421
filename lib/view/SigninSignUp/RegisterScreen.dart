import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/PersonalDetails.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FocusNode _FirstnameFocusNode = FocusNode();
  late FocusNode _LastnameFocusNode = FocusNode();
  late FocusNode _emailFocusNode = FocusNode();
  late FocusNode _phoneFocusNode = FocusNode();
  late FocusNode _passwordFocusNode = FocusNode();
  late FocusNode _confirmPassFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _FirstnameFocusNode.dispose();
    _LastnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: kThirdColor,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          title: customText("Register", white, 16.sp, FontWeight.w700),
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              _FirstnameFocusNode.unfocus();
              _LastnameFocusNode.unfocus();
              _emailFocusNode.unfocus();
              _phoneFocusNode.unfocus();
              _passwordFocusNode.unfocus();
              _confirmPassFocusNode.unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1.sh - 0.12.sh,
                  // height: 1.sh + 0.22.sh,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      Container(
                        width: 1.sw,
                        // height: 1.sh + 200,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        decoration: BoxDecoration(
                          color: kThirdColor,
                        ),
                        child: Column(
                          children: [
                            customText("Get started with your profile", white,
                                20.sp, FontWeight.w700),
                          ],
                        ),
                      ),
                      PartOne(
                        confirmPassFocusNode: _confirmPassFocusNode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PartOne extends StatelessWidget {
  final confirmPassFocusNode;
  PartOne({
    this.confirmPassFocusNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: Stack(
        children: [
          Container(
            // height: 1.sh + 400,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    // height: 1.sh + 400,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Blackbox(text: "1"),
                    WhiteBox(text: "2"),
                    WhiteBox(text: "3"),
                    WhiteBox(text: "4"),
                    WhiteBox(text: "5"),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                  child: Signup(confirmPassFocusNode: confirmPassFocusNode),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Signup extends StatefulWidget {
  var confirmPassFocusNode;
  Signup({Key? key, this.confirmPassFocusNode}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _Firstname = TextEditingController();
  final _Lastname = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPass = TextEditingController();

  var genderList = [
    'Male',
    'Femal',
  ];
  var selectedGender;

  var exampleList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedExample;
  var selectedAge;

  @override
  void initState() {
    selectedGender = genderList[0];
    selectedExample = exampleList[0];
    selectedAge = 20.toString();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _Firstname.dispose();
    _Lastname.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            customText("Sign Up", kThirdColor, 16.sp, FontWeight.w700),
            SizedBox(height: 25.h),
            TextFormField(
                controller: _Firstname,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter user name';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                ],
                decoration: myInputDecoration(hintText: 'First Name')),
            SizedBox(height: 15.h),
            TextFormField(
                controller: _Lastname,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter user name';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                ],
                decoration: myInputDecoration(hintText: 'Last Name')),
            SizedBox(height: 15.h),
            TextFormField(
                controller: _email,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter email address';
                  } else if (!value.isEmail) {
                    return 'Please enter valid email address';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]'))
                ],
                keyboardType: TextInputType.emailAddress,
                decoration: myInputDecoration(hintText: 'E-mail Address')),
            SizedBox(height: 15.h),
            TextFormField(
                controller: _phone,
                maxLength: 10,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter phone number';
                  } else if (!value.isPhoneNumber) {
                    return 'Please enter valid phone number';
                  }
                },
                decoration: myInputDecoration(hintText: 'Phone Number')),
            SizedBox(height: 5.h),
            TextFormField(
                controller: _password,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter password';
                  } else if (value.trim().length < 5) {
                    return 'Password should be greater than 4 character';
                  }
                },
                obscureText: true,
                decoration: myInputDecoration(hintText: 'Password')),
            SizedBox(height: 15.h),
            TextFormField(
                controller: _confirmPass,
                focusNode: widget.confirmPassFocusNode,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter confirm password';
                  } else if (value.trim() != _password.text) {
                    return 'Password does not match';
                  }
                },
                obscureText: true,
                decoration: myInputDecoration(hintText: 'Confirm Password')),
            SizedBox(
              height: 5.h,
            ),
            genderDropDown(),
            exampleDropDown(),
            ageDropDown(),
            SizedBox(
                width: 1.sw,
                height: 50.h,
                child: DefaultButton(
                    text: "Next",
                    press: () {
                      // Get.to(
                      //   () => PersonalDetails(),
                      // );
                      if (_formKey.currentState!.validate()) {
                        _registerUser1();
                      }
                    }))
          ],
        ),
      ),
    );
  }

  genderDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Gender", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedGender,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedGender = value as String;
            });
          },
          items: genderList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  exampleDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Example", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedExample,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedExample = value as String;
            });
          },
          items: exampleList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  ageDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Age", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedAge,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedAge = value as String;
            });
          },
          items: [
            // if you change the initial index value then change the iniState value ...selectedAge = 20.toString();
            for (int index = 20; index <= 60; index++)
              DropdownMenuItem<String>(
                value: index.toString(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: customText(index.toString(), Color(0xFF707070), 14.sp,
                      FontWeight.w400),
                ),
              )
          ],
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  void _registerUser1() async {
    final param = {
      "FirstName": "${_Firstname.text.trim()}",
      "LastName": "${_Lastname.text.trim()}",
      "Email": "${_email.text.trim()}",
      "ContactNo": "${_phone.text.trim()}",
      "Password": "${_password.text.trim()}",
      "Example": "${selectedExample}",
      "Gender": "${selectedGender}",
      "Age": "${selectedAge}",
      "OnTable": "REG1"
    };
    var result = await networkcallService.register(param);

    if (result != null) {
      Get.to(
        () => PersonalDetails(),
      );
    }
  }
}
