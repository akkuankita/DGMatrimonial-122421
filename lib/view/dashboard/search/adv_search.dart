import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/search/search_result.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AdvSearch extends StatefulWidget {
  const AdvSearch({Key? key}) : super(key: key);

  @override
  _AdvSearchState createState() => _AdvSearchState();
}

class _AdvSearchState extends State<AdvSearch> {
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

  var residincialStatusList = [
    'Any',
    'Permanent Resident',
    'Work Permit',
  ];
  var selectedResidincialStatusRadiogroupVal;

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
    selectedResidincialStatusRadiogroupVal = residincialStatusList[0];
    selectedemployedInList.add(employedInList[0]);
    selectedGender = genderList[0];
  }

  @override
  Widget build(BuildContext context) {
    String? _personType, _religion, _motherTongue;
    return Scaffold(
        // backgroundColor: bg,
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 30, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: customText('1. Prefered Details', commonColor, 0.06.sw,
                    FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            customText('Gender', commonColor, 18,   FontWeight.w400),
            /* ---------------looking for---------- */
            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 10,
            ),
            customText('Aged', black, 18,   FontWeight.w400),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          min = min + 1;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(0.08.sw),
                    height: 50,
                    width: 0.5.sw,
                    child: Center(child: customText('$min', primaryColor, 16,FontWeight.w400))),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: white,
                    child: IconButton(
                      onPressed: () {
                        min = min - 1;
                        setState(() {
                          print(min);
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: customText('to', grey, 16,FontWeight.w400),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: white,
                    child: IconButton(
                      onPressed: () {
                        max = max + 1;
                        setState(() {
                          print(max);
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(0.08.sw),
                    height: 50,
                    width: 0.5.sw,
                    child: Center(child: customText('$max', primaryColor, 16,FontWeight.w400))),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: white,
                    child: IconButton(
                      onPressed: () {
                        max = max - 1;
                        setState(() {
                          print(max);
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ),
              ],
            ),
            customText('Height', commonColor, 18,   FontWeight.w400),
            SizedBox(
              height: 5,
            ),
            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 5,
            ),
            Center(
              child: customText('to', grey, 16,FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            customText('Of Relegion', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 5,
            ),
            /* --------------Relegion-------------- */

            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            customText('& Mother tongue', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 5,
            ),
            /* ----------------Mother tongue--------------- */

            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            customText('Cast', commonColor, 18,   FontWeight.w400),
            SizedBox(
              height: 5,
            ),
            /* ----------------Mother tongue--------------- */

            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            customText('Physical Status', commonColor, 18,
                  FontWeight.w400),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: physicalStatusList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: InkWell(
                    onTap: () {
                      print(physicalStatusList[i]);
                      setState(() {
                        selectedPhycialStatusRadiogroupVal =
                            physicalStatusList[i];
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(physicalStatusList[i], Colors.black54, 17,
                              FontWeight.w400),
                        selectedPhycialStatusRadiogroupVal ==
                                physicalStatusList[i]
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
              height: 20,
            ),
            Center(
              child: customText('2. Location', commonColor, 0.06.sw,
                    FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            customText('Country', commonColor, 18,   FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: MultiSelectDialogField(
                    items:
                        countryList.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      selectedCountryList = values;
                    },
                    searchable: true,
                    chipDisplay: MultiSelectChipDisplay(
                      items: selectedCountryList
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      onTap: (value) {
                        setState(() {
                          selectedCountryList.remove(value);
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            customText('Resident Status', commonColor, 18,
                  FontWeight.w400),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: residincialStatusList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: InkWell(
                    onTap: () {
                      print(residincialStatusList[i]);
                      setState(() {
                        selectedResidincialStatusRadiogroupVal =
                            residincialStatusList[i];
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(residincialStatusList[i], lightBlack, 17,
                              FontWeight.w400),
                        selectedResidincialStatusRadiogroupVal ==
                                residincialStatusList[i]
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
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: customText('3. Education', commonColor, 0.06.sw,
                    FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            customText('Education Categories', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: MultiSelectDialogField(
                    items: educationCategoryList
                        .map((e) => MultiSelectItem(e, e))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      selectedEducationCategoryList = values;
                    },
                    searchable: true,
                    chipDisplay: MultiSelectChipDisplay(
                      items: selectedEducationCategoryList
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      onTap: (value) {
                        setState(() {
                          selectedEducationCategoryList.remove(value);
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            customText('Employed In', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: employedInList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customText(employedInList[i], lightBlack, 17,
                              FontWeight.w400),
                        Checkbox(
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value:
                              selectedemployedInList.contains(employedInList[i])
                                  ? true
                                  : false,
                          onChanged: (value) {
                            setState(() {
                              if (value != null && value) {
                                selectedemployedInList.add(employedInList[i]);
                              } else {
                                selectedemployedInList
                                    .remove(employedInList[i]);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            customText('Occupation Category', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: MultiSelectDialogField(
                    items: occupationCategoryList
                        .map((e) => MultiSelectItem(e, e))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      selectedOccupationCategoryList = values;
                    },
                    searchable: true,
                    chipDisplay: MultiSelectChipDisplay(
                      items: selectedOccupationCategoryList
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      onTap: (value) {
                        setState(() {
                          selectedOccupationCategoryList.remove(value);
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            customText('Annual Income', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 15,
            ),
            /* -------------- Relegion -------------- */

            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            Center(
              child: customText('4. Horoscope Details', commonColor, 0.06.sw,
                    FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            customText('Star', commonColor, 18,   FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: MultiSelectDialogField(
                    items:
                        countryList.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      selectedCountryList = values;
                    },
                    searchable: true,
                    chipDisplay: MultiSelectChipDisplay(
                      items: selectedCountryList
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      onTap: (value) {
                        setState(() {
                          selectedCountryList.remove(value);
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            customText('Dosh', commonColor, 18,   FontWeight.w400),
            SizedBox(
              height: 5,
            ),
            /* ----------------Mother tongue--------------- */

            customDropDown(genderList, selectedGender),
            SizedBox(
              height: 20,
            ),
            Center(
              child: customText('5. Habits', commonColor, 0.06.sw,
                    FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            customText('Eating Habits', commonColor, 18,
                  FontWeight.w400),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: EatingHabitList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customText(EatingHabitList[i], lightBlack, 17,
                              FontWeight.w400),
                        Checkbox(
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value: selectedEatingHabitList
                                  .contains(EatingHabitList[i])
                              ? true
                              : false,
                          onChanged: (value) {
                            setState(() {
                              if (value != null && value) {
                                selectedEatingHabitList.add(EatingHabitList[i]);
                              } else {
                                selectedEatingHabitList
                                    .remove(EatingHabitList[i]);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 30,
            ),
            button(() {
              Get.to(() => SearchResult());
            }, 'Search', mainColor, white),
          ],
        ),
      ),
    ));
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
      ),
    );
  }
}
