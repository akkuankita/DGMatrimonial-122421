import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/Profile/profileController.dart';
import 'package:matrimonial/view/dashboard/details/details.dart';
import 'package:matrimonial/view/dashboard/save_page.dart';

class Profile extends StatefulWidget {
  Profile({Key? key,}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        'https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              customText('Customer Name', mainColor, 20, FontWeight.w400),
              SizedBox(
                height: 5,
              ),
              customText('xyz@gmail.com', commonColor, 16, FontWeight.w400),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => profileDetailsPage());
                },
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText('Profile', commonColor, 18, FontWeight.w400),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SavePage());
                },
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            'My members', commonColor, 18, FontWeight.w400),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.to(() => Pricing());
                },
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText('Membership plan', commonColor, 18,
                            FontWeight.w400),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText('Partner Preference', commonColor, 18,
                          FontWeight.w400),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: mainColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                profile,
                // fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
