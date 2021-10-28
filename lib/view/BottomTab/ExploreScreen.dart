import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/search/searchDashboard.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: kSecColor,
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: Image.asset("assets/images/logo.png",
              width: 100.w, fit: BoxFit.contain),
        ),
        actions: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
                // border: Border.all(color: Color(0xFF0C4880)),
                borderRadius: BorderRadius.circular(50.r)),
            child: Icon(Icons.notifications_active, color: white, size: 22.sp),
          ),
          // CircleAvatar(
          //    // backgroundColor: Colors.white30,
          //     child: IconButton(

          //       onPressed: () {},
          //       icon: Icon(Icons.notifications_active, color: white),
          //     )),
          SizedBox(width: 15.w),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => SearchDashboard());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // margin: EdgeInsets.all(0.08.sw),
                      height: 50,
                      // width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 15.w),
                            customText('Find your partner', Colors.black45,
                                16.sp, FontWeight.w400),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/banner.png",
                        fit: BoxFit.contain),
                    SizedBox(height: 30.h),
                    customText(
                        "Your Matches", kSecColor, 18.sp, FontWeight.w700),
                  ],
                ),
              ),
              Container(
                height: 280.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MiniProfile();
                    }),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText("Millions of happy stories", kSecColor, 16.sp,
                        FontWeight.w700),
                    SizedBox(height: 28.h),
                    HappyStories(
                      name: "Sweta & Rishi",
                      image: "assets/images/profile1.png",
                      description:
                          "6 yrs, 5.4, Never married Bengali, Hindu, Kayastha (Bengali), Higher Secondary School / High School, Not working, Kolkata, West Bengal",
                    ),
                    HappyStories1(
                      name: "Sweta & Rishi",
                      image: "assets/images/profile1.png",
                      description:
                          "6 yrs, 5.4, Never married Bengali, Hindu, Kayastha (Bengali), Higher Secondary School / High School, Not working, Kolkata, West Bengal",
                    ),
                    HappyStories(
                      name: "Sweta & Rishi",
                      image: "assets/images/profile1.png",
                      description:
                          "6 yrs, 5.4, Never married Bengali, Hindu, Kayastha (Bengali), Higher Secondary School / High School, Not working, Kolkata, West Bengal",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HappyStories extends StatelessWidget {
  const HappyStories({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
  }) : super(key: key);
  final String name, image, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 166.h,
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: white,
        // gradient: boxColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          Container(
            height: 166.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: Color(0xFFFFD7B7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.h,
                  height: 120.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(image,
                        fit: BoxFit.fill, width: 120.h, height: 120.h),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(name, kSecColor, 18.sp, FontWeight.w700),
                      SizedBox(height: 8.h),
                      Flexible(
                          child: customText(
                              description, kSecColor, 15.sp, FontWeight.w400))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HappyStories1 extends StatelessWidget {
  const HappyStories1({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
  }) : super(key: key);
  final String name, image, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 166.h,
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: white,
        // gradient: boxColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 166.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: Color(0xFFFFD7B7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(name, kSecColor, 18.sp, FontWeight.w700),
                      SizedBox(height: 8.h),
                      Flexible(
                          child: customText(
                              description, kSecColor, 15.sp, FontWeight.w400))
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: 120.h,
                  height: 120.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(image,
                        fit: BoxFit.cover, width: 120.h, height: 120.h),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiniProfile extends StatelessWidget {
  const MiniProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      margin: EdgeInsets.only(right: 10.w, left: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180.w,
              height: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0,
                        offset: Offset(8, 8),
                        color: Color(0xFFFFD7B7))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.fill,
                  height: 100.w,
                  width: .9.sw,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            customText("Full Name", kPrimaryColor, 18.sp, FontWeight.w700),
            SizedBox(height: 8.h),
            customText(
                "It is a long established fact that a reader will be distracted by the",
                kSecColor,
                15.sp,
                FontWeight.w500),

            // Column(
            //   children: [
            //     CircleAvatar(
            //       radius: 25,
            //       backgroundColor: kPrimaryColor,
            //       child: Icon(
            //         Icons.call,
            //         color: white,
            //       ),
            //     ),
            //     SizedBox(
            //       height: 0.02.sh,
            //     ),
            //     CircleAvatar(
            //       radius: 25,
            //       backgroundColor: kPrimaryColor,
            //       child: Icon(Icons.chat, color: white),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

//  ListView.builder(
//                         itemCount: 2,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return medicineListCard();
//                         }),
