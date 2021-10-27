import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/Profile/profileController.dart';
import 'package:matrimonial/view/dashboard/search/search_result.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class profileDetailsPage extends StatefulWidget {
  var profileId;
  profileDetailsPage({Key? key, this.profileId}) : super(key: key);

  @override
  _profileDetailsPageState createState() => _profileDetailsPageState();
}

class _profileDetailsPageState extends State<profileDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isFirstSelected = true;
  bool _isSecondSelected = false;
  ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _profileController.fetchProfileDetails(profileId: 154);
      // _profileController.fetchProfileDetails(profileId: widget.profileId);
    });

    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        _isFirstSelected = true;
        _isSecondSelected = false;
      } else {
        _isFirstSelected = false;
        _isSecondSelected = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            automaticallyImplyLeading: false,
            title: Text('Details'),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getFirstPart(),
                ],
              ),
            ),
          )),
    );
  }

  getFirstPart() {
    return Obx(() {
      var data = _profileController.profileModel.value.data![0];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 0.4.sw,
                height: 0.4.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0,
                          offset: Offset(10, 10),
                          color: backGroundColor)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomCashedNetworImage(
                    imageUrl: img,
                  ),
                ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: Icon(
                      Icons.call,
                      color: white,
                    ),
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: Icon(Icons.chat, color: white),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          customText(data.fullName!, commonColor, 0.06.sw, FontWeight.w700),
          customText(
              'Profile Created By Myself', commonColor, 16, FontWeight.w300),
          SizedBox(
            height: 0.02.sh,
          ),
          getRichText('Age: ', data.age.toString()),
          getRichText('Height : ', data.heightFt),
          getRichText('Religion : ', data.religion),
          getRichText('Caste : ', data.caste),
          getRichText('Sub Caste : ', data.subCaste),
          getRichText('Location : ', data.preferableLoc),
          getRichText('Education  : ', data.education),
          getRichText('Profession : ', data.education),
          getRichText('Annual Income : ', data.annualIncome),
          // getRichText('Location : ', 'Location'),

          button(() {
            Get.to(() => SearchResult());
          }, 'Send Interest', mainColor, white),
          SizedBox(
            height: 0.02.sh,
          ),
          button(() {
            Get.to(() => SearchResult());
          }, 'Like ', grayColor, white),

          getTabSection(),
        ],
      );
    });
  }

  getTabSection() {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: bg,
          // height: 0.1.sh,
          margin: EdgeInsets.only(top: 20),
          child: TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.zero,
            indicatorColor: white,
            labelColor: white,
            unselectedLabelColor: black,
            unselectedLabelStyle: TextStyle(color: white),
            tabs: [
              Container(
                  // width: 0.9.sw,
                  color: _isFirstSelected ? mainColor : backGroundColor,
                  alignment: Alignment.center,
                  child: Text(
                    '\nDetails\n',
                  )),
              Container(
                  // width: 1.sw,
                  alignment: Alignment.center,
                  color: _isSecondSelected ? mainColor : backGroundColor,
                  child: Text(
                    '\nPhotos\n',
                  )),
            ],
          ),
        ),
        Container(
            // color: Colors.pink,
            width: 1.sw,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                child: getPersonal_info(),
              ),
            ))
      ],
    );
  }

  getPersonal_info() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Personal Information', commonColor, 0.05.sw, FontWeight.w500),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Brief', mainColor, 0.04.sw, FontWeight.w500),
      customText(
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal',
          black,
          0.04.sw,
          FontWeight.w300),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Basic Details', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Name : ', 'Random Name'),
      getRichText2('Age : ', '80kg'),
      getRichText2('Height : ', '4 Ft 6 In / 137 Cms'),
      getRichText2('Weight : ', '41 Kgs / 90 Lbs'),
      getRichText2('Mother Tongue : ', 'Bangali'),
      getRichText2('Sub Caste : ', '41 Kgs / 90 Lbs'),
      getRichText2('Marital Status : ', 'Never Married'),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Contact Details', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Contact Number : ', '2364-5768-86r8'),
      getRichText2('Send Mails : ', 'Yes'),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Relegion Information', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Relegion : ', 'Hindu'),
      getRichText2('Cast/sub cast : ', 'none'),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Partner Preference', commonColor, 0.05.sw, FontWeight.w500),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Brief', mainColor, 0.04.sw, FontWeight.w500),
      customText(
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal',
          black,
          0.04.sw,
          FontWeight.w300),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Basic Details', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Name : ', 'Random Name'),
      getRichText2('Age : ', '80kg'),
      getRichText2('Height : ', '4 Ft 6 In / 137 Cms'),
      getRichText2('Weight : ', '41 Kgs / 90 Lbs'),
      getRichText2('Mother Tongue : ', 'Bangali'),
      getRichText2('Sub Caste : ', '41 Kgs / 90 Lbs'),
      getRichText2('Marital Status : ', 'Never Married'),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Contact Details', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Contact Number : ', '2364-5768-86r8'),
      getRichText2('Send Mails : ', 'Yes'),
      SizedBox(
        height: 0.02.sh,
      ),
      customText('Relegion Information', mainColor, 0.04.sw, FontWeight.w500),
      SizedBox(
        height: 0.01.sh,
      ),
      getRichText2('Relegion : ', 'Hindu'),
      getRichText2('Cast/sub cast : ', 'none'),
    ]);
  }

  getRichText(text1, text2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: customizeTextStyle(
            FontWeight.bold,
            0.1.sw,
            black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: customizeTextStyle(
                  FontWeight.w700,
                  0.09.sw,
                  black,
                )),
            TextSpan(
              text: text2,
              style: customizeTextStyle(
                FontWeight.w400,
                0.08.sw,
                black,
              ),
            )
          ],
        ),
        textScaleFactor: 0.5,
      ),
    );
  }

  getRichText2(text1, text2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: customizeTextStyle(
                FontWeight.w400,
                0.04.sw,
                black,
              )),
          Text(
            text2,
            style: customizeTextStyle(
              FontWeight.w400,
              0.04.sw,
              black,
            ),
          )
        ],
      ),
    );
  }
}
