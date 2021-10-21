import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: customText('Search Result', white, 18, FontWeight.w400),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.07.sh,
              child: ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  width: 10,
                ),
                itemCount: 13,
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (_, int i) {
                  return Chip(
                      label: customText(
                          'Kolkata', commonColor, 15, FontWeight.w400),
                      deleteIcon: Icon(Icons.close),
                      onDeleted: () {
                        print('d');
                      },
                      deleteIconColor: black);
                },
              ),
            ),
            ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                height: 5,
              ),
              itemCount: 5,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (_, int i) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(0.06.sw),
                    margin: EdgeInsets.all(0.02.sw),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
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
                        customText(
                            '6 yrs, 5, Never married Bengali, Hindu, Kayastha Bengali, Higher Secondary School High School, Not working, Kolkata, West Bengal',
                            commonColor,
                            16,
                            FontWeight.w300),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
