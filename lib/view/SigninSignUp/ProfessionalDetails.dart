import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrimonial/Controller/registerController.dart';
import 'package:matrimonial/model/Country.dart';
import 'package:matrimonial/model/city.dart';
import 'package:matrimonial/model/state.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/view/SigninSignUp/AboutyourSelf.dart';
import 'package:matrimonial/view/SigninSignUp/comonWidget.dart';
import 'package:matrimonial/view/components/DefaultButton.dart';

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
  var highestEducationCategoryList = [
    'Aviation Degree',
    'software Engeneer',
    'BCA',
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

  var occupationCategoryList = [
    'Airline',
    'bsf',
    'ca',
  ];
  var selectedOccupationCategory;
  var annualIncomeCurrencyList = [
    'Airline',
    'bsf',
    'ca',
  ];
  var selectedAnnualIncomeCurrency;

  var employedInList = [
    'Permanent Resident',
    'Work Permit',
  ];
  var selectedemployedIn;
  RegisterController _controller = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    selectedHighestEducationCategory = highestEducationCategoryList[0];
    selectedMaritalStatusRadiogroupVal = maritalStatusList[0];
    selectedOccupationCategory = occupationCategoryList[0];
    selectedAnnualIncomeCurrency = annualIncomeCurrencyList[0];
    selectedemployedIn = employedInList[0];
    initialDataFetching();
  }

  initialDataFetching() async {
    await _controller.fetchCountryList();
    _controller.selectedCountry = _controller.listOfCountry[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            customText(
                "Professional Details", kThirdColor, 16.sp, FontWeight.w700),
            SizedBox(height: 25.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("Highest Education", Color(0xFF707070), 14.sp,
                    FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          child: Text('  Highest Education'), value: 'A'),
                      DropdownMenuItem(
                          child: Text('Highest Education'), value: 'B'),
                      DropdownMenuItem(
                          child: Text('  Highest Education'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                    "Employed In", Color(0xFF707070), 14.sp, FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          child: Text('Government/PSU'), value: 'A'),
                      DropdownMenuItem(
                          child: Text('Government/PSU'), value: 'B'),
                      DropdownMenuItem(
                          child: Text('Government/PSU'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                    "Annual Income", Color(0xFF707070), 14.sp, FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(child: Text('INR'), value: 'A'),
                      DropdownMenuItem(child: Text('INR'), value: 'B'),
                      DropdownMenuItem(child: Text('INR'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("  Work Location", Color(0xFF707070), 14.sp,
                    FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          child: Text('United States'), value: 'A'),
                      DropdownMenuItem(
                          child: Text('United States'), value: 'B'),
                      DropdownMenuItem(child: Text('United States'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
            countryDropDown(),
            stateDropDown(),
            cityDropDown(),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                    "  Citizenship", Color(0xFF707070), 14.sp, FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(child: Text('Citizenship'), value: 'A'),
                      DropdownMenuItem(
                          child: Text('  Citizenship'), value: 'B'),
                      DropdownMenuItem(child: Text('Citizenship'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("  Resident Status", Color(0xFF707070), 14.sp,
                    FontWeight.w400),
                SizedBox(height: 8.h),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        // borderSide:  ,
                      ),
                    ),
                    value: _selectedValue,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          child: Text('Permanent Status'), value: 'A'),
                      DropdownMenuItem(
                          child: Text('Permanent Status'), value: 'B'),
                      DropdownMenuItem(
                          child: Text('Permanent Status'), value: 'C')
                    ]),
                SizedBox(height: 25.h),
              ],
            ),
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
                      Get.to(() => AboutyourSelf());
                    })),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  void sendDataToApi() async {
    try {
      final body = {
        "Id": "1",
        "Education": " ",
        "Occupation": " ",
        "Currency": " ",
        "AnnualIncome": " ",
        "EmployedIn": " ",
        "CountryName": " ",
        "State": " ",
        "City": " ",
        "Citizenship": " ",
        "ResidentialSts": " ",
        "PreferableLoc": " ",
        "OnTable": "REG4",
      };
      var result = await networkcallService.register(body: body, registerNo: 4);
      if (result) {
        Get.to(
          () => AboutyourSelf(),
        );
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
              // borderSide:  ,
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
                child: customText(value.country!, Color(0xFF707070), 14.sp,
                    FontWeight.w400),
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
                child: customText(value.state!, Color(0xFF707070), 14.sp,
                    FontWeight.w400),
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
                child: customText(value.city!, Color(0xFF707070), 14.sp,
                    FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }


}
