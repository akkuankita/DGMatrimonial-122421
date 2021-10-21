import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/search/searchDashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: Image.asset(
            logo,
            width: 100,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white30,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active,
                    color: white,
                  )))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText('Find your partner', white, 25,
                      FontWeight.bold),
                SizedBox(
                  height: 10,
                ),
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 0.03.sw,
                        ),
                        Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 0.05.sw,
                        ),
                        customText('Please enter some text', primaryColor, 16,FontWeight.w400),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText('Millions of happy stories', mainColor, 18,
                    FontWeight.bold),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.4.sh,
                child: ListView.separated(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, int) {
                    return Container(
                      width: 0.6.sw,
                      child: Stack(
                        // clipBehavior: Clip.antiAlias,
                        children: [
                          Card(
                            // elevation: 3,
                            //color: red,
                            margin: EdgeInsets.only(top: 0.08.sh),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 0.08.sh, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('Sweta & Rishi', primaryColor, 20,
                                        FontWeight.bold),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  customText(
                                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                                      commonColor,
                                      16,FontWeight.w400),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  customText('Learn More', textColor, 15,FontWeight.w400),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            right: 1,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                  'https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    width: 10,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              customText('Frequently Asked Questionss', mainColor, 18,
                    FontWeight.bold),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                separatorBuilder: (_, __) => SizedBox(
                  width: 10,
                ),
                itemCount: 15,
                itemBuilder: (_, int) {
                  return ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Alignment.topLeft,
                    iconColor: mainColor,
                    childrenPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    textColor: black,
                    initiallyExpanded: false,
                    title: Container(
                      height: 0.06.sh,
                      width: double.infinity,
                      child: customText(
                          '\nWhat is the purpose of our site?', black, 18,FontWeight.w400),
                    ),
                    children: [
                      customText(
                          '\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n',
                          black,
                          18,FontWeight.w400),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
