import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/ProfessionalDetails.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class MoreperDetail extends StatefulWidget {
  const MoreperDetail({Key? key}) : super(key: key);

  @override
  State<MoreperDetail> createState() => _MoreperDetailState();
}

class _MoreperDetailState extends State<MoreperDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kThirdColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: customText("Register", white, 16.sp, FontWeight.w700),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 1.sh - 0.12.sh,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 120.h,
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
                      PartOne(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PartOne extends StatelessWidget {
  const PartOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: Stack(
        children: [
          Container(
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
                    Blackbox(text: "2"),
                    Blackbox(text: "3"),
                    WhiteBox(text: "4"),
                    WhiteBox(text: "5"),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                  child: MorePersonalInfo(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MorePersonalInfo extends StatefulWidget {
  const MorePersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<MorePersonalInfo> createState() => _MorePersonalInfoState();
}

class _MorePersonalInfoState extends State<MorePersonalInfo> {
  var maritalStatusList = [
    'Never Married',
    'Widowed',
    'Divorced',
    'Awaiting Devorced',
  ];
  var selectedMaritalStatus;

  var noOfChildrenList = [
    'None',
    'one',
    'Two',
    'Three and above',
  ];
  var selectedNoOfChildren;

  var heightInFitList = [
    '1ft',
    '2ft',
    '3ft',
    '4ft',
    '5ft',
    '6ft',
    '7ft',
    '8ft',
    '9ft',
    '10ft',
  ];
  var selectedHeightInFit;

  var heightInInchList = [
    '1Inch',
    '2Inch',
    '3Inch',
    '4Inch',
    '5Inch',
    '6Inch',
    '7Inch',
    '8Inch',
    '9Inch',
    '10Inch',
  ];
  var selectedHeightInInch;

  var familyStatusList = [
    'High Class',
    'Middle Class',
    'Lower Class',
  ];
  var selectedFamilyStatus;

  var familyTypeList = [
    'Joint',
    'Nuclear',
  ];
  var selectedFamilyType;

  var familyValuesList = [
    'Orthodox',
    'Traditional',
    'Moderate',
    'Liberal',
  ];
  var selectedFamilyValues;

  var disabilityList = [
    'None',
    'Phycially challenged',
  ];
  var selectedDisability;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            customText(
                "More Personal Details", kThirdColor, 16.sp, FontWeight.w700),
            SizedBox(height: 25.h),
            maritalStatusWidget(),
            noOfChildrenWidget(),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("Height", Color(0xFF707070), 14.sp, FontWeight.w400),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: heightInFitDropDown(),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: heightInInchDropDown(),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
              ],
            ),
            familyStatusDropDown(),
            familyTypeDropDown(),
            familyValueDropDown(),
            disabilityDropDown(),
            faimalyBackGroundTextField(),
            SizedBox(
                width: 1.sw,
                height: 50.h,
                child: GreyButton(
                    text: "Back",
                    press: () {
                      Get.back();
                    })),
            SizedBox(height: 25.h),
            SizedBox(
                width: 1.sw,
                height: 50.h,
                child: DefaultButton(
                    text: "Next",
                    press: () {
                      Get.to(() => ProfessionalDetails());
                    })),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  maritalStatusWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('Drinking', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: maritalStatusList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedMaritalStatus = maritalStatusList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        maritalStatusList[i], lightBlack, 17, FontWeight.w400),
                    selectedMaritalStatus == maritalStatusList[i]
                        ? Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.white,
                              border: Border.all(
                                  color: commonColor, // Set border color
                                  width: 3),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: commonColor,
                              ),
                            ),
                          )
                        : Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.white,
                              border: Border.all(
                                  color: commonColor, // Set border color
                                  width: .0),
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  noOfChildrenWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('No. of children', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: noOfChildrenList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedNoOfChildren = noOfChildrenList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        noOfChildrenList[i], lightBlack, 17, FontWeight.w400),
                    selectedNoOfChildren == noOfChildrenList[i]
                        ? Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.white,
                              border: Border.all(
                                  color: commonColor, // Set border color
                                  width: 3),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: commonColor,
                              ),
                            ),
                          )
                        : Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.white,
                              border: Border.all(
                                  color: commonColor, // Set border color
                                  width: .0),
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  heightInFitDropDown() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          // borderSide:  ,
        ),
      ),
      value: selectedHeightInFit,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          selectedHeightInFit = value as String;
        });
      },
      items: heightInFitList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: customText(value, Color(0xFF707070), 14.sp, FontWeight.w400),
          ),
        );
      }).toList(),
    );
  }

  heightInInchDropDown() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          // borderSide:  ,
        ),
      ),
      value: selectedHeightInInch,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          selectedHeightInInch = value as String;
        });
      },
      items: heightInInchList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: customText(value, Color(0xFF707070), 14.sp, FontWeight.w400),
          ),
        );
      }).toList(),
    );
  }

  familyStatusDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Family Status", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedFamilyStatus,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedFamilyStatus = value as String;
            });
          },
          items: familyStatusList.map<DropdownMenuItem<String>>((String value) {
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

  familyTypeDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Family Type", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedFamilyType,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedFamilyType = value as String;
            });
          },
          items: familyTypeList.map<DropdownMenuItem<String>>((String value) {
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

  familyValueDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Family Values", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedFamilyValues,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedFamilyValues = value as String;
            });
          },
          items: familyValuesList.map<DropdownMenuItem<String>>((String value) {
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

  disabilityDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Any Disability", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedDisability,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedDisability = value as String;
            });
          },
          items: disabilityList.map<DropdownMenuItem<String>>((String value) {
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

  faimalyBackGroundTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            "Family background", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        Container(
          // width: 0.4.sw,
          // height: 0.06.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: backGroundColor),
            // color: backGroundColor,
          ),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
