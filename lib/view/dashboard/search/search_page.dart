import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/customs/button.dart';
import 'package:matrimonial/view/dashboard/search/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // TextEditingController _search = TextEditingController();
  String? _personType, _religion, _motherTongue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText('I am looking for', commonColor, 18,
                    FontWeight.w400),
              SizedBox(
                height: 15,
              ),
              /* ---------------looking for---------- */
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: DropdownButton<String>(
                    icon: SizedBox(),
                    iconSize: 1,
                    hint: Container(
                      width: 0.9.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                            child: customText('Groom', commonColor, 18,FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                            child: Icon(Icons.arrow_drop_down_outlined),
                          )
                        ],
                      ),
                    ),
                    value: _personType,
                    // elevation: 16,
                    style: TextStyle(color: primaryColor),
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _personType = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: customText(value, commonColor, 18,FontWeight.w400),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              customText('Aged', black, 18,   FontWeight.w400),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.all(0.08.sw),
                      height: 50,
                      width: 0.5.sw,
                      child: Center(child: customText('11', primaryColor, 16,FontWeight.w400))),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: customText('to', grey, 16,FontWeight.w400),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.all(0.08.sw),
                      height: 50,
                      width: 0.5.sw,
                      child: Center(child: customText('11', primaryColor, 16,FontWeight.w400))),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: mainColor,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ],
              ),
              customText('Of Relegion', commonColor, 18,
                    FontWeight.w400),
              SizedBox(
                height: 15,
              ),
              /* --------------Relegion-------------- */
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: DropdownButton<String>(
                    value: _religion,
                    icon: SizedBox(),
                    iconSize: 1,
                    hint: Container(
                      width: 0.9.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                            child: customText('Bengali', commonColor, 18,FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                            child: Icon(Icons.arrow_drop_down_outlined),
                          )
                        ],
                      ),
                    ),
                    style: TextStyle(color: primaryColor),
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _religion = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: customText(value, commonColor, 18,FontWeight.w400),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              customText('& Mother tongue', commonColor, 18,
                    FontWeight.w400),
              SizedBox(
                height: 15,
              ),
              /* ----------------Mother tongue--------------- */
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  child: DropdownButton<String>(
                    value: _religion,
                    icon: SizedBox(),
                    iconSize: 1,
                    hint: Container(
                      width: 0.9.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.02.sw, 0, 0, 0),
                            child: customText('Hindu', commonColor, 18,FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                            child: Icon(Icons.arrow_drop_down_outlined),
                          )
                        ],
                      ),
                    ),
                    style: TextStyle(color: primaryColor),
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _motherTongue = newValue!;
                      });
                    },
                    items: ['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: customText(value, commonColor, 18,FontWeight.w400),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              button(() {
                Get.to(() => SearchResult());
              }, 'Search', mainColor, white),
            ],
          ),
        ),
      ),
    );
  }
}
