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
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            color: bg,
            margin: EdgeInsets.only(top: 20),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              indicatorColor: white,
              labelColor: white,
              unselectedLabelColor: black,
              unselectedLabelStyle: TextStyle(color: white),
              tabs: [
                Container(
                    width: 1.sw,
                    color: _isFirstSelected ? mainColor : bg,
                    alignment: Alignment.center,
                    child: Text(
                      '\nChat\n',
                    )),
                Container(
                    width: 1.sw,
                    alignment: Alignment.center,
                    color: _isSecondSelected ? mainColor : bg,
                    child: Text(
                      '\nMember\n',
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: TabBarView(
              controller: _tabController,
              children: [MyChat(), MemberChat()],
            ),
          ),
        ],
      )),
    );
  }
}
