import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/recyclebin/SigninSignUpWidget.dart';
import 'package:matrimonial/recyclebin/register/PersonalDetailsRegister.dart';
import 'package:matrimonial/recyclebin/signInSignUp.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';
import 'package:matrimonial/view/dashboard/search/search_result.dart';
import 'package:matrimonial/view/dashboard/widget/circularLodar.dart';

class Register extends StatefulWidget {
  final tabController;
  Register({this.tabController});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false;

  var genderList = [
    'Male',
    'Femal',
  ];
  var selectedGender;

  @override
  void initState() {
    selectedGender = genderList[0];
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() async {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          title: Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey2,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (_, i) {
                            return SizedBox(
                              width: 30,
                            );
                          },
                          itemBuilder: (_, i) {
                            return CircleAvatar(
                              radius: 22,
                              backgroundColor: mainColor,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: white,
                                child: customText(
                                    (i + 1).toString(), black, 0.06.sw,
                                      FontWeight.w700),
                              ),
                            );
                          }),
                    ),
                    firstRegisterSection(),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  /// 1st Register-------------------------------
  firstRegisterSection() {
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
                hintText: 'First Name',
                controller: nameController,
                color: black,
                borderColor: black,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter First Name ";
                  } else if (value.trim().isEmpty) {
                    return "Enter First Name ";
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
                hintText: 'Last Name',
                controller: nameController,
                color: black,
                borderColor: black,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Last Name ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Last Name ";
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
                hintText: 'Phone Number',
                controller: phoneController,
                color: black,
                borderColor: black,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Phone Number ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Phone Number ";
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
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15,left: 10,right: 10),
          child: customDropDown(genderList, selectedGender),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => SignInSignUp());
                // Get.to(() => PersonalDetailsRegister());
              },
              child: Container(
                width: 0.4.sw,
                height: 0.06.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backGroundColor,
                ),
                child: Center(child: customText('Prev', black, 18,FontWeight.w400)),
              ),
            ),
            SizedBox(width: 0.02.sw),
            InkWell(
              onTap: () {
                // Get.to(() => DashboardPage());
                Get.to(() => PersonalDetailsRegister());
              },
              child: Container(
                width: 0.4.sw,
                height: 0.06.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor,
                ),
                child: Center(child: customText('Next', white, 18,FontWeight.w400)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  customDropDown(itemList, selectedItem) {
    return Card(
      color: backGroundColor,
      elevation: 2,
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              // dropdownColor: commonColor,
              value: selectedItem,
              iconSize: 1,
              hint: Container(
                width: 0.7.sw,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                  child: customText(selectedItem, commonColor, 18,FontWeight.w400),
                ),
              ),
              // elevation: 16,
              style: TextStyle(color: primaryColor),
              underline: SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue!;
                  print(selectedItem);
                });
              },
              items: itemList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: customText(value, commonColor, 18,FontWeight.w400),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
            child: Icon(
              Icons.arrow_drop_down_outlined,
            ),
          )
        ],
      ),
    );
  }

  /// Register-------------------------------
  Future<void> studentRegister({
    name,
    mobile,
    email,
    password,
    confirm_password,
    payment_note,
    plan_id,
  }) async {
    setState(() {
      isLoading = true;
    });
    try {
      // bool result = await networkcallService.studentRegisterApi(
      //   name: name,
      //   mobile: mobile,
      //   email: email,
      //   password: password,
      //   payment_note: payment_note,
      //   plan_id: plan_id,
      // );
      setState(() {
        isLoading = false;
      });

      // if (result) {
      //   // Get.to(DashBoradPage());
      // }
    } catch (e) {
      print(e);
      isLoading = false;
      setState(() {});
      // if (e.isNetworkError != null && e.isNetworkError) {
      //   showToast(e.customMessage, red);
      // } else {
      //   showToast(e.customMessage, red);
      // }
    }
  }
}
