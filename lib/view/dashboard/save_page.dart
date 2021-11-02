import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/Profile/profiledetails.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  var genderList = [
    'Male',
    'Femal',
  ];
  var selectedGender;

  @override
  void initState() {
    selectedGender = genderList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF8F8F8),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                          'Filter', Colors.black, 19.sp, FontWeight.w700),
                      Container(
                        width: 112.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 12.w),
                            Expanded(
                              child: DropdownButton<String>(
                                // dropdownColor: commonColor,
                                value: selectedGender,
                                iconSize: 1,
                                hint: customText(selectedGender,
                                    Color(0xFF090927), 18, FontWeight.w400),
                                style: TextStyle(color: primaryColor),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGender = newValue!;
                                    print(selectedGender);
                                  });
                                },
                                items: genderList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: customText(value, Colors.black87,
                                        14.sp, FontWeight.w500),
                                  );
                                }).toList(),
                              ),
                            ),
                            Icon(Icons.expand_more_rounded,
                                color: kPrimaryColor),
                            SizedBox(width: 12.w),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.only(bottom: 12.h),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  'Person Name',
                                                  kPrimaryColor,
                                                  16.sp,
                                                  FontWeight.w600),
                                              SizedBox(height: 8.h),
                                              customText(
                                                  'user@gmail.com',
                                                  black,
                                                  16.sp,
                                                  FontWeight.w400),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 60.h,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              width: 2,
                                              color: Color(0xFFFFE8E1)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: CustomCashedNetworImage(
                                            imageUrl: img,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  Divider(color: Color(0xFFDBDBDB)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 8.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customText('View', Color(0xFF818181),
                                            16.sp, FontWeight.w400),
                                        customText('Remove', Color(0xFF818181),
                                            16.sp, FontWeight.w400),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
