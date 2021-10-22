import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/Controller/personalDetailsRegisterController.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/SigninSignUp/MorepersonalDetail.dart';
import 'package:matrimonial/view/SigninSignUp/SplashScreen/OnBoarding.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

class PersonalDetails extends StatefulWidget {
  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
                    WhiteBox(text: "3"),
                    WhiteBox(text: "4"),
                    WhiteBox(text: "5"),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                  child: PersonalInfo(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  var relegionList = [
    'No answer',
    'Agnostic',
    'Buddhist/Taoist',
    'Christian/Catholic',
    'Christian/LDS',
    'Muslim / Islam ',
    'Spiritual but not religious',
    'Christian',
    'Other',
  ];
  var selectedRelegion;

  var motherTongueList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedMotherTongue;

  var divisionList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedDivision;

  var subcasteList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedSubcaste;

  var personalityList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedPersonality;

  var doshList = [
    'Myself',
    'Son',
    'Daughter',
  ];
  var selectedDosh;

  var EatingHabitList = [
    'All',
    'Vegetarian',
    'Non Vegetarian',
    'Eggitarian',
  ];
  var selectedEatingHabit;

  var SmokingHabitList = [
    'Social smoker',
    'Anxious smoker',
    'Skinny smoker',
    'Addicted smoker',
    'None of them',
  ];
  var selectedSmokingHabit;

  var DrinkingHabitList = [
    'Alcoholic',
    'Non-Alcoholic',
    'None of them',
  ];
  var selectedDrinkingHabit;

  var HobbiesList = [
    'Travelling',
    'Sports',
    'Movies/Series',
    'Music',
    'Parties',
  ];
  var selectedHobbies;
  bool willingToMarryFromOtherCommunities = false;
  PersonalDetailsRegisterController _controller =
      Get.put(PersonalDetailsRegisterController());

  @override
  void initState() {
    selectedRelegion = relegionList[0];
    selectedMotherTongue = motherTongueList[0];
    selectedDivision = divisionList[0];
    selectedSubcaste = subcasteList[0];
    selectedPersonality = personalityList[0];
    selectedDosh = doshList[0];
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initialDataFetching();
    });
    super.initState();
  }

  initialDataFetching() async {
    await _controller.fetchCastList();
    print(_controller.listOfCastSubcast[0].casteId);
    _controller.selectedCast = _controller.listOfCastSubcast[0];
    print(_controller.selectedCast);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              customText(
                  "PersonalDetails", kThirdColor, 16.sp, FontWeight.w700),
              SizedBox(height: 25.h),
              relegionDropDown(),
              motherToungDropDown(),
              divisionDropDown(),
              castDropDown(),
              subCastDropDown(),
              doshDropDown(),
              CheckboxListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: willingToMarryFromOtherCommunities,
                  title: customText(
                      "Willing to marry from other communities also",
                      kThirdColor,
                      11.sp,
                      FontWeight.w400),
                  onChanged: (value) {
                    willingToMarryFromOtherCommunities = value!;
                    setState(() {});
                  }),
              personalityDropDown(),
              eatingHabitWidget(),
              smokingHabitWidget(),
              drinkingHabitWidget(),
              hobbiesWidget(),
              SizedBox(height: 25.h),
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
                        // sendDataToApi();
                        Get.to(() => MoreperDetail());
                      })),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      );
    });
  }

  void sendDataToApi() async {
    final param = {
      // "FirstName": "${_Firstname.text.trim()}",
      // "LastName": "${_Lastname.text.trim()}",
      // "Email": "${_email.text.trim()}",
      // "ContactNo": "${_phone.text.trim()}",
      // "Password": "${_password.text.trim()}",
      // "Example": "${selectedExample}",
      // "Gender": "${selectedGender}",
      // "Age": "${selectedAge}",
      // "OnTable": "REG1"
    };
    var result = await networkcallService.register(param);

    if (result != null) {
      Get.to(
        () => PersonalDetails(),
      );
    }
  }

  relegionDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Relegion", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedRelegion,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedRelegion = value as String;
            });
          },
          items: relegionList.map<DropdownMenuItem<String>>((String value) {
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

  motherToungDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Mother Tongue", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedMotherTongue,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedMotherTongue = value as String;
            });
          },
          items: motherTongueList.map<DropdownMenuItem<String>>((String value) {
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

  divisionDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Division", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedDivision,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedDivision = value as String;
            });
          },
          items: divisionList.map<DropdownMenuItem<String>>((String value) {
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

  castDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Cast", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: _controller.selectedCast,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedCast = value as CasteList;
            });
          },
          items: _controller.listOfCastSubcast
              .map<DropdownMenuItem<CasteList>>((CasteList value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(value.casteName!, Color(0xFF707070), 14.sp,
                    FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  subCastDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Sub Cast", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedSubcaste,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedSubcaste = value as String;
            });
          },
          items: subcasteList.map<DropdownMenuItem<String>>((String value) {
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

  doshDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Dosh", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedDosh,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedDosh = value as String;
            });
          },
          items: doshList.map<DropdownMenuItem<String>>((String value) {
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

  personalityDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Personality", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedPersonality,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedPersonality = value as String;
            });
          },
          items: personalityList.map<DropdownMenuItem<String>>((String value) {
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

  eatingHabitWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('Eating Habits', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: EatingHabitList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  print(EatingHabitList[i]);
                  setState(() {
                    selectedEatingHabit = EatingHabitList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        EatingHabitList[i], lightBlack, 17, FontWeight.w400),
                    selectedEatingHabit == EatingHabitList[i]
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

  smokingHabitWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('Smoking', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: SmokingHabitList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  print(SmokingHabitList[i]);
                  setState(() {
                    selectedSmokingHabit = SmokingHabitList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        SmokingHabitList[i], lightBlack, 17, FontWeight.w400),
                    selectedSmokingHabit == SmokingHabitList[i]
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

  drinkingHabitWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('Drinking', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: DrinkingHabitList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  print(DrinkingHabitList[i]);
                  setState(() {
                    selectedDrinkingHabit = DrinkingHabitList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        DrinkingHabitList[i], lightBlack, 17, FontWeight.w400),
                    selectedDrinkingHabit == DrinkingHabitList[i]
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

  hobbiesWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        customText('Hobbies', commonColor, 18, FontWeight.w400),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: HobbiesList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  print(HobbiesList[i]);
                  setState(() {
                    selectedHobbies = HobbiesList[i];
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(HobbiesList[i], lightBlack, 17, FontWeight.w400),
                    selectedHobbies == HobbiesList[i]
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
}
