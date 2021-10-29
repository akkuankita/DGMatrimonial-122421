import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/Controller/registerController.dart';
import 'package:matrimonial/model/Country.dart';
import 'package:matrimonial/model/Prefloc.dart';
import 'package:matrimonial/model/city.dart';
import 'package:matrimonial/model/state.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';
import 'package:matrimonial/view/SigninSignUp/AboutyourSelf.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class ProfessionalDetails extends StatelessWidget {
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
                        // height: 120.h,
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
                    Blackbox(text: "4"),
                    WhiteBox(text: "5"),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                  child: ProDetail(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProDetail extends StatefulWidget {
  const ProDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ProDetail> createState() => _ProDetailState();
}

String _selectedValue = 'A';

class _ProDetailState extends State<ProDetail> {
  final _formKey = GlobalKey<FormState>();
  final _citizenshipController = TextEditingController();
  final _anualIncomeController = TextEditingController();
  var highestEducationCategoryList = [
    "No Answer",
    "High school",
    "College",
    "University",
    "Bachelors degree",
    "Master degree",
    "PhD/Post Doctoral",
  ];
  var selectedHighestEducationCategory;

  var maritalStatusList = [
    'Government/PSU',
    'Private',
    'Business',
    'Defence',
    'Self Employed',
    'Not Working',
  ];
  var selectedMaritalStatusRadiogroupVal;

  var occupationCategoryList = ["Yes", "No"];
  var selectedOccupationCategory;
  var annualIncomeCurrencyList = ["INR", "USD"];
  var selectedAnnualIncomeCurrency;

  var employedInList = [
    "Government/PSU",
    "Private",
    " Business",
    "Defence",
    "Self Employed",
    "Not Working"
  ];
  var selectedemployedIn;
  var residentialList = ["Permanent", "Work Permit", "Citizen", "Student visa"];
  var selectedresidential;
  RegisterController _controller = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      selectedHighestEducationCategory = highestEducationCategoryList[0];
      selectedMaritalStatusRadiogroupVal = maritalStatusList[0];
      selectedOccupationCategory = occupationCategoryList[0];
      selectedAnnualIncomeCurrency = annualIncomeCurrencyList[0];
      selectedresidential = residentialList[0];
      selectedemployedIn = employedInList[0];
      initialDataFetching();
    });
  }

  initialDataFetching() async {
    await _controller.fetchCountryList();
    _controller.selectedCountry = _controller.listOfCountry[0];
    await _controller.fetchPrefloc();
    // _controller.selectedPreflocList = _controller.listOfPrefloc[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            SizedBox(height: 40.h),
            customText(
                "Professional Details", kThirdColor, 16.sp, FontWeight.w700),
            SizedBox(height: 25.h),
            highestEducationDropDown(),
            SizedBox(height: 8.h),
            occupationDropDown(),
            annualIncomeDropDown(),
            employedInDropDown(),
            countryDropDown(),
            stateDropDown(),
            cityDropDown(),
            residentialStatus(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                customText("Citizenship", Colors.black, 15, FontWeight.w300),
                SizedBox(height: 5),
                TextFormField(
                  controller: _citizenshipController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Citizenship ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Citizenship ";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Citizenship',
                    hintStyle:
                        TextStyle(color: Colors.black54, fontSize: 0.03.sw),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      // borderSide:  ,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.grey[300],
                      elevation: 2,
                      child: MultiSelectDialogField(
                        items: _controller.listOfPrefloc.map((e) {
                          var preferableLocation = e?.preferableLoc;
                          return MultiSelectItem(e, preferableLocation!);
                        }).toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (List<PreflocData?> values) {
                          _controller.selectedPreflocList.assignAll(values);
                        },
                        searchable: true,
                        chipDisplay: MultiSelectChipDisplay(
                          items: _controller.selectedPreflocList.map((e) {
                            var preferableLocation = e?.preferableLoc;
                            return MultiSelectItem(e, preferableLocation!);
                          }).toList(),
                          onTap: (PreflocData? value) {
                            setState(() {
                              _controller.selectedPreflocList.remove(value);
                            });
                          },
                        ),
                      ),
                    )),
                SizedBox(height: 25.h),
                SizedBox(
                    width: 1.sw,
                    height: 50.h,
                    child: DefaultButton(
                        text: "Next",
                        press: () {
                          sendDataToApi();
                          // Get.to(() => AboutyourSelf());
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
            )
          ]))),
    );
  }

  void sendDataToApi() async {
    try {
      var userId = sharePrefereceInstance.getuserId();
      var preflocation = _controller.selectedPreflocList.map((e) => e?.id);
      var preflocationStringFormate =
          preflocation.toString().replaceAll('(', '').replaceAll(')', '');
      print(preflocation.toString().replaceAll('(', '').replaceAll(')', ''));
      // if (userId != null) {
      // if (_controller.selectedCountry?.country != null &&
      //     _controller.selectedState.state != null &&
      //     _controller.selectedCity.city != null) {
      if (_formKey.currentState!.validate()) {
        final body = {
          "Id": "$userId",
          "Education": "$selectedHighestEducationCategory",
          "Occupation": "$selectedOccupationCategory",
          "Currency": "$selectedAnnualIncomeCurrency",
          "AnnualIncome": "${_anualIncomeController.text}",
          "EmployedIn": "$selectedemployedIn",
          "CountryName": "${_controller.selectedCountry?.id ?? ''}",
          "State": "${_controller.selectedState?.id ?? ''}",
          "City": "${_controller.selectedCity?.id ?? ''}",
          "Citizenship": "${_citizenshipController.text}",
          "ResidentialSts": "$selectedresidential",
          "PreferableLoc": "${preflocationStringFormate}",
          "OnTable": "REG4",
        };
        var result =
            await networkcallService.register(body: body, registerNo: 4);
        if (result) {
          Get.to(
            () => AboutyourSelf(),
          );
        }
      } else {
        showSnack('please enter the required field');
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
  }

  countryDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Country", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide: ,
            ),
          ),
          value: _controller.selectedCountry,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedCountry = value as CountryData;
              _controller.fetchStateList(_controller.selectedCountry.id);
            });
          },
          items: _controller.listOfCountry
              .map<DropdownMenuItem<CountryData>>((CountryData value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value.country!, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  stateDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("State", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: _controller.selectedState,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedState = value as StateData;
              _controller.fetchCityList(_controller.selectedState.id);
            });
          },
          items: _controller.listOfState
              .map<DropdownMenuItem<StateData>>((StateData value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value.state!, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  cityDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("City", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: _controller.selectedCity,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _controller.selectedCity = value as CityData;
            });
          },
          items: _controller.listOfCity
              .map<DropdownMenuItem<CityData>>((CityData value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: customText(
                    value.city!, Color(0xFF707070), 14.sp, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  highestEducationDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            "HighestEducation", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedHighestEducationCategory,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedHighestEducationCategory = value as String;
            });
          },
          items: highestEducationCategoryList
              .map<DropdownMenuItem<String>>((String value) {
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

  occupationDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(" Occupation", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedOccupationCategory,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedOccupationCategory = value as String;
            });
          },
          items: occupationCategoryList
              .map<DropdownMenuItem<String>>((String value) {
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

  annualIncomeDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Annual Income", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        Container(
          // width: 0.6.sw,
          height: 0.07.sh,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  // width: 0.6.sw,
                  height: 0.08.sh,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: selectedAnnualIncomeCurrency,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedAnnualIncomeCurrency = value as String;
                      });
                    },
                    items: annualIncomeCurrencyList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                          child: customText(
                              value, Color(0xFF707070), 14.sp, FontWeight.w400),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: 0.6.sw,
                height: 0.09.sh,
                padding: EdgeInsets.only(left: 5),
                child: TextFormField(
                  controller: _anualIncomeController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Enter Amount ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Enter Amount ";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      // borderSide:  ,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }

  employedInDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Employed In", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedemployedIn,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedemployedIn = value as String;
            });
          },
          items: employedInList.map<DropdownMenuItem<String>>((String value) {
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

  residentialStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            "Residential Status", Color(0xFF707070), 14.sp, FontWeight.w400),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // borderSide:  ,
            ),
          ),
          value: selectedresidential,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedresidential = value as String;
            });
          },
          items: residentialList.map<DropdownMenuItem<String>>((String value) {
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
}
