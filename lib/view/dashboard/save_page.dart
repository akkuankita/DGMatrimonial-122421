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
          backgroundColor: backGroundColor,
          body: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText('Filter', commonColor, 0.06.sw, FontWeight.w500),
                    SizedBox(
                      width: 0.3.sw,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              // dropdownColor: commonColor,
                              value: selectedGender,
                              iconSize: 1,
                              hint: Container(
                                // width: 0.8.sw,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                                  child: customText(selectedGender, commonColor,
                                      18, FontWeight.w400),
                                ),
                              ),
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
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: customText(value, commonColor, 18,
                                        FontWeight.w400),
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
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            // Get.to(MessageScreen());
                            // Get.to(() => DetailsPage());
                          },
                          child: Container(
                              height: 0.12.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 0.07.sh,
                                    height: 0.07.sh,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CustomCashedNetworImage(
                                        imageUrl: img,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText('Name', black, 18,
                                              FontWeight.bold),
                                          customText('user@gmail.com', black,
                                              14, FontWeight.w400),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
