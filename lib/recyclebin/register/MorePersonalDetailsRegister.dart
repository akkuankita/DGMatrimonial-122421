import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matrimonial/recyclebin/register/PersonalDetailsRegister.dart';
import 'package:matrimonial/recyclebin/register/ProfessionalDetailsRegister.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';
import 'package:matrimonial/view/dashboard/search/search_result.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MorePersonalDetailsRegister extends StatefulWidget {
  const MorePersonalDetailsRegister({Key? key}) : super(key: key);

  @override
  _MorePersonalDetailsRegisterState createState() =>
      _MorePersonalDetailsRegisterState();
}

class _MorePersonalDetailsRegisterState
    extends State<MorePersonalDetailsRegister> {
  var maritalStatusList = [
    'Never Married',
    'Widowed',
    'Divorced',
    'Awaiting Devorced',
  ];
  var selectedMaritalStatusRadiogroupVal;

  var isCheckedSelected = true;

  var genderList = [
    'Male',
    'Femal',
  ];
  var selectedGender;

  var from_heightList = [
    '4 ft 8 in -137 cm',
    '4 ft 8 in -137 cm',
  ];
  var selected_from_Height;

  var to_heightList = [
    '4 ft 8 in -137 cm',
    '4 ft 8 in -137 cm',
  ];
  var selected_to_Height;

  var religionList = [
    'Gender',
    'Femal',
  ];
  var selectedReligion;

  var physicalStatusList = [
    'Dosn’t Matter',
    'Normal',
    'Physically Challenged',
  ];
  var selectedPhycialStatusRadiogroupVal;

  var countryList = [
    'India',
    'usa',
    'UK',
  ];
  List selectedCountryList = [];

  var educationCategoryList = [
    'Aviation Degree',
    'software Engeneer',
    'BCA',
  ];
  List selectedEducationCategoryList = [];

  var employedInList = [
    'Permanent Resident',
    'Work Permit',
  ];
  var selectedemployedInList = [];

  var EatingHabitList = [
    'All',
    'Vegetarian',
    'Non Vegetarian',
    'Eggitarian',
  ];
  var selectedEatingHabitList = [];

  var occupationCategoryList = [
    'Airline',
    'bsf',
    'ca',
  ];
  List selectedOccupationCategoryList = [];
  int min = 20;
  int max = 45;

  @override
  void initState() {
    super.initState();
    selectedPhycialStatusRadiogroupVal = physicalStatusList[0];
    selectedMaritalStatusRadiogroupVal = maritalStatusList[0];
    selectedemployedInList.add(employedInList[0]);
    selectedGender = genderList[0];
  }

  @override
  Widget build(BuildContext context) {
    String? _personType, _religion, _motherTongue;
    return SafeArea(
      child: Scaffold(
          // backgroundColor: bg,
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customText('More Personal Details', commonColor, 0.06.sw,
                  FontWeight.w500),
              SizedBox(
                height: 20,
              ),
              customText('Marital Status', commonColor, 18, FontWeight.w400),
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
                        print(maritalStatusList[i]);
                        setState(() {
                          selectedMaritalStatusRadiogroupVal =
                              maritalStatusList[i];
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(maritalStatusList[i], lightBlack, 17,
                              FontWeight.w400),
                          selectedMaritalStatusRadiogroupVal ==
                                  maritalStatusList[i]
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: mainColor,
                                  ),
                                )
                              : Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: mainColor, // Set border color
                                        width: .0),
                                  ),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              customText('No. of children', commonColor, 18, FontWeight.w400),
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
                        print(maritalStatusList[i]);
                        setState(() {
                          selectedMaritalStatusRadiogroupVal =
                              maritalStatusList[i];
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(maritalStatusList[i], lightBlack, 17,
                              FontWeight.w400),
                          selectedMaritalStatusRadiogroupVal ==
                                  maritalStatusList[i]
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: mainColor,
                                  ),
                                )
                              : Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: mainColor, // Set border color
                                        width: .0),
                                  ),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),

              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              customText('Height', commonColor, 18, FontWeight.w400),
              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              customText('Family Status', commonColor, 18, FontWeight.w400),
              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              customText('Family type', commonColor, 18, FontWeight.w400),
              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              customText('Family Values', commonColor, 18, FontWeight.w400),
              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              customText('Any Disability', commonColor, 18, FontWeight.w400),
              /* ---------------looking for---------- */
              customDropDown(genderList, selectedGender),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => PersonalDetailsRegister());
                    },
                    child: Container(
                      width: 0.4.sw,
                      height: 0.06.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backGroundColor,
                      ),
                      child: Center(
                          child:
                              customText('Prev', black, 18, FontWeight.w400)),
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  InkWell(
                    onTap: () {
                      Get.to(() => ProfessionalDetailsRegister());
                    },
                    child: Container(
                      width: 0.4.sw,
                      height: 0.06.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor,
                      ),
                      child: Center(
                          child:
                              customText('Next', white, 18, FontWeight.w400)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  customDropDown(itemList, selectedItem) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.grey[300],
        elevation: 2,
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                // dropdownColor: commonColor,
                value: selectedItem,
                iconSize: 1,
                hint: Container(
                  width: 0.8.sw,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                    child: customText(
                        selectedItem, commonColor, 18, FontWeight.w400),
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
                      child:
                          customText(value, commonColor, 18, FontWeight.w400),
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
      ),
    );
  }
}
