import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matrimonial/recyclebin/register/ProfessionalDetailsRegister.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/dashboard.dart';
// import 'package:matrimonial/view/dashboard/search/search_result.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

class AboutYouRegister extends StatefulWidget {
  const AboutYouRegister({Key? key}) : super(key: key);

  @override
  _AboutYouRegisterState createState() =>
      _AboutYouRegisterState();
}

class _AboutYouRegisterState
    extends State<AboutYouRegister> {

  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();

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
            children: [
              customText('Write Something About You', commonColor, 0.06.sw,
                    FontWeight.w500),
              SizedBox(
                height: 20,
              ),
              customText('Write about yourself in minimum of 60 words', commonColor, 18,
                    FontWeight.w400),
              Container(
                // width: 0.4.sw,
                // height: 0.06.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 4,color: backGroundColor),
                  // color: backGroundColor,
                ),
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => ProfessionalDetailsRegister());
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
                      Get.to(() => DashboardPage());
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
          ),
        ),
      )),
    );
  }

}
