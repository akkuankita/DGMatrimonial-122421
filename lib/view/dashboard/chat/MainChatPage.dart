import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/dashboard/chat/MemberChat.dart';
import 'package:matrimonial/view/dashboard/chat/MyChat.dart';
import 'package:matrimonial/view/dashboard/search/adv_search.dart';
import 'package:matrimonial/view/dashboard/search/search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({Key? key}) : super(key: key);

  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFirstSelected = true;
  bool _isSecondSelected = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: bg,
                  ),
                  padding: EdgeInsets.all(8),
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    controller: _tabController,
                    indicatorColor: white,
                    labelColor: white,
                    unselectedLabelColor: black,
                    unselectedLabelStyle: TextStyle(color: white),
                    tabs: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: _isFirstSelected ? mainColor : bg,
                          ),
                          width: 1.sw,
                          height: 33.h,
                          child: Center(
                            child: Text(
                              'Chat',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: _isSecondSelected ? mainColor : bg,
                          ),
                          width: 1.sw,
                          height: 33.h,
                          child: Center(
                            child: Text(
                              'Member',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  flex: 2,
                  child: TabBarView(
                    controller: _tabController,
                    children: [MyChat(), MemberChat()],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
