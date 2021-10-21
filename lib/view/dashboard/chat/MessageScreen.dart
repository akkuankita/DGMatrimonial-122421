import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/dashboard/search/adv_search.dart';
import 'package:matrimonial/view/dashboard/search/search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/view/dashboard/widget/cashed_network_image.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            // iconTheme: IconThemeData(color:black),
            elevation: 0,
            backgroundColor: mainColor,
            title: customText('Chat', white, 18,FontWeight.w400),
          ),
          body: Column(
            children: [topContainer(), buildMessages(), buildInput()],
          )),
    );
  }

  Widget topContainer() {
    return Container(
        height: 0.08.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Name of Customer  ', black, 18,
                              FontWeight.bold),
                        customText('Online', colorGreenAccent, 14,
                              FontWeight.w400),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.more_vert),
          ],
        ));
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (value) {
                    // onSendMessage(textEditingController.text, 0);
                  },
                  style: TextStyle(color: primaryColor, fontSize: 15.0),
                  // controller: textEditingController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type your message...',
                    // hintStyle: TextStyle(color: greyColor),
                  ),
                  // focusNode: focusNode,
                ),
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: grey, width: 0.5)),
          color: Colors.white),
    );
  }

  Widget buildMessages() {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: 1.sw,
                // height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          // width: 1.sw,
                          // height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white),
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: customText(
                                    'It is a long established fact It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layoutthat a reader will be distracted by the readable content of a page when looking at its layout',
                                    black,
                                    14,
                                      FontWeight.w500),
                              ),
                              customText('\n 2:30 PM', grayColor, 14,
                                    FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
