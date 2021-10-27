import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:matrimonial/Controller/registerController.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/model/divisionModel.dart';
import 'package:matrimonial/model/hobbies.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';
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

  bool willingToMarryFromOtherCommunities = false;
  RegisterController _controller = Get.put(RegisterController());

  @override
  void initState() {
    selectedRelegion = relegionList[0];
    selectedMotherTongue = motherTongueList[0];

    selectedPersonality = personalityList[0];
    selectedDosh = doshList[0];
    selectedEatingHabit = EatingHabitList[0];
    selectedSmokingHabit = SmokingHabitList[0];
    selectedDrinkingHabit = DrinkingHabitList[0];
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initialDataFetching();
    });
    super.initState();
  }

  initialDataFetching() async {
    await _controller.fetchCastList();
    await _controller.fetchHobbie();
    _controller.selectedCast = _controller.listOfCastSubcast[0];
    _controller.selectedHobbies = _controller.hobbiesList[0];

    await _controller.fetchDivision();
    _controller.selectedDivision = _controller.divisionList[0];

    await _controller.fetchCountryList();
    setState(() {});
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
              hobbiesWidget(),
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
              SizedBox(height: 25.h),
              SizedBox(
                  width: 1.sw,
                  height: 50.h,
                  child: DefaultButton(
                      text: "Next",
                      press: () {
                        sendDataToApi();
                        // Get.to(() => MoreperDetail());
                      })),
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
            ],
          ),
        ),
      );
    });
  }

  void sendDataToApi() async {
    try {
      var userId = sharePrefereceInstance.getuserId();
      // if (userId != null) {
      if (_controller.selectedCast.casteId != null &&
          _controller.selectedSubcast.subCasteId != null &&
          _controller.selectedHobbies.id != null &&
          _controller.selectedDivision.id != null) {
        final body = {
          "Id": "$userId",
          "Religion": "$selectedRelegion",
          "Language": "$selectedMotherTongue",
          "DivisionName": "${_controller.selectedDivision.id}",
          "OtherCommu": "$willingToMarryFromOtherCommunities",
          "CasteName": "${_controller.selectedCast.casteId}",
          "SubCaste": "${_controller.selectedSubcast.subCasteId}",
          "Dosh": "$selectedDosh",
          "Personality": "$selectedPersonality",
          "EatingHabits": "$selectedEatingHabit",
          "Smoking": "$selectedSmokingHabit",
          "Drinking": "$selectedDrinkingHabit",
          "Hobbies": "${_controller.selectedHobbies.id}",
          "OnTable": "REG2",
        };
        // print(body);
        var result =
            await networkcallService.register(body: body, registerNo: 2);
        if (result) {
          Get.to(
            () => MoreperDetail(),
          );
        }
      } else {
        showSnack('please fill up all information');
      }
    } catch (e) {
      if (e is CustomError) {
        if (e.isNetworkError != null && (e.isNetworkError)!) {
          showSnack(e.customMessage);
        } else {
          showSnack(e.customMessage);
        }
      }
    }
    // }
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
          value: _controller.selectedDivision,
          isExpanded: true,
          onChanged: (value) {
            _controller.changeSelectedDivision(value as DivisionData);
            setState(() {});
          },
          items: _controller.divisionList
              .map<DropdownMenuItem<DivisionData>>((DivisionData value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value.division!, Color(0xFF707070), 14.sp, FontWeight.w400),
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
            _controller.changeSelectedCast(value as CasteList);
            setState(() {});
            // var cast = value as CasteList;
            // setState(() {
            //   _controller.selectedCast = value as CasteList;
            // });
            // _controller.fetchSubcastList(cast.casteId!);
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
          value: _controller.selectedSubcast,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedSubcast = value as Subcastelist;
            });
          },
          items: _controller.listOfSubcast
              .map<DropdownMenuItem<Subcastelist>>((Subcastelist value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(value.subCasteName!, Color(0xFF707070), 14.sp,
                    FontWeight.w400),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Hobbies", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: _controller.selectedHobbies,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedHobbies = value as HobbieData;
            });
          },
          items: _controller.hobbiesList
              .map<DropdownMenuItem<HobbieData>>((HobbieData value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value.hobbies!, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
