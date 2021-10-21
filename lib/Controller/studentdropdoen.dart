// import 'dart:collection';
// import 'dart:convert';
// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:edustudio/Controller/student_controller.dart';
// import 'package:edustudio/Model/countryListModel.dart';
// import 'package:edustudio/view/DashboardScreen/DashBoardWidget.dart';
// import 'package:edustudio/view/DashboardScreen/DrawerCustomPaint.dart';
// import 'package:edustudio/Widget/LoginWidget.dart';
// import 'package:edustudio/Widget/circularLodar.dart';
// import 'package:edustudio/services/Networkcall.dart';
// import 'package:edustudio/util/constant.dart';
// import 'package:edustudio/util/error_handler.dart';
// import 'package:edustudio/util/sharePreference_instance.dart';
// import 'package:edustudio/view/student_profile/editStudentProfileController.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'package:provider/provider.dart';

// class EditStudentProfile extends StatefulWidget {
//   @override
//   _EditStudentProfileState createState() => _EditStudentProfileState();
// }

// class _EditStudentProfileState extends State<EditStudentProfile> {
//   final _formKey = GlobalKey<FormState>();

//   StudentController studentController = Get.put(StudentController());
//   EditStudentProfileController editStudentProfileController =
//       Get.put(EditStudentProfileController());

//   var isLoading = false;

//   TextEditingController nameController;
//   TextEditingController emailController;
//   TextEditingController mobileController;
//   TextEditingController alternativeMobileController;
//   TextEditingController educationController;
//   TextEditingController add1Controller;
//   TextEditingController add2Controller;
//   TextEditingController dobController;
//   TextEditingController joiningresonController;
//   TextEditingController interest_cat_ids;
//   TextEditingController zipController;

//   // var planidController = TextEditingController();
//   // var paymentnoteController = TextEditingController();
//   // var passwordController = TextEditingController();
//   File _image;
//   final picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     studentController.fetchCountryList();
//     initilizeTextField();
//   }

//   @override
//   void Dispose() {
//     studentController.clearData();
//   }

//   initilizeTextField() async {
//     var profileResponce =
//         await editStudentProfileController.fetchStudentProfile();
//     if (profileResponce != null) {
//       nameController = TextEditingController(text: profileResponce['name']);
//       emailController = TextEditingController(text: profileResponce['email']);
//       mobileController = TextEditingController(text: profileResponce['mobile']);
//       alternativeMobileController =
//           TextEditingController(text: profileResponce['alternate_phone']);
//       educationController =
//           TextEditingController(text: profileResponce['education']);
//       add1Controller =
//           TextEditingController(text: profileResponce['address_line_one']);
//       add2Controller =
//           TextEditingController(text: profileResponce['address_line_two']);
//       dobController =
//           TextEditingController(text: profileResponce['date_of_birth']);
//       joiningresonController =
//           TextEditingController(text: profileResponce['joining_reason']);
//       interest_cat_ids =
//           TextEditingController(text: profileResponce['interest_cat_ids']);
//       zipController = TextEditingController(text: profileResponce['zipcode']);
//       studentController.initialCountry.value = profileResponce['country'];
//       studentController.initialState.value = profileResponce['state'];
//       studentController.initialcity.value = profileResponce['city_name'];
//       // print(studentController.selectedCity.name);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         body: Stack(
//           children: [
//             DrawerCustomPaint(),
//             !editStudentProfileController.isLoading.value
//                 ? SingleChildScrollView(
//                     child: Container(
//                       child: Column(
//                         children: [
//                           SigninSignUpWidget().getHeightSizedBox(0.15.sh),
//                           GestureDetector(
//                             onTap: () async {
//                               // 22 may,2021, 3.55 pm editing image picker
//                               await imagePicker();
//                             },
//                             child: Stack(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 0.12.sw,
//                                   child: CircleAvatar(
//                                     radius: 0.11.sw,
//                                     backgroundImage: _image != null
//                                         ? FileImage(_image)
//                                         : editStudentProfileController
//                                                     ?.profileData !=
//                                                 null
//                                             ? NetworkImage(
//                                                 (editStudentProfileController
//                                                         .profileData[
//                                                     'profile_photo']['path']),
//                                               )
//                                             : AssetImage(user),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 0.0,
//                                   right: 0.0,
//                                   child: CircleAvatar(
//                                     radius: 12,
//                                     backgroundColor: white,
//                                     child: Icon(
//                                       Icons.camera_alt,
//                                       size: 0.04.sw,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           //--------------------------------------
//                           SigninSignUpWidget().getHeightSizedBox(0.03.sh),
//                           _getSignUpForm(1.sh),
//                           SigninSignUpWidget().getHeightSizedBox(0.03.sh),
//                           !isLoading
//                               ? GestureDetector(
//                                   onTap: () async {
//                                     updateProfile();
//                                     /* var message = await Networkcall().saveUserDetails(
//                       user_email: _emailController.text,
//                       user_name: _nameController.text,
//                       user_phone: _phoneController.text,
//                       image_url: _image.path);
//                   print(message);
//                   showToast(message, red);
//                   setState(() {});*/
//                                   },
//                                   child: SigninSignUpWidget()
//                                       .getLoginSignupButton(
//                                           width: 1.sw, text: 'UPDATE PROFILE'),
//                                 )
//                               : CircularLoader(),
//                           SigninSignUpWidget().getHeightSizedBox(0.1.sh),
//                         ],
//                       ),
//                     ),
//                   )
//                 : SizedBox(
//                     height: 1.sh,
//                     child: Center(child: CircularProgressIndicator()))
//           ],
//         ),
//       ),
//     );
//   }

//   updateProfile() async {
//     if (_formKey.currentState.validate()) {
//       {
//         setState(() {
//           isLoading = true;
//         });
//         var uri = Uri.parse(BASE_URL + updateProfileUrl);
//         // print(uri.toString());
//         // print(img);
//         // print(base64Encode(img));
//         var request = http.MultipartRequest('POST', uri);
//         request.headers['Accept'] = 'application/json';
//         request.headers['Authorization'] =
//             'Bearer ${SharePreferenceInstance().getUserToken()}';
//         if (_image != null) {
//           // var img = await _image.readAsBytes();
//           request.files.add(
//             http.MultipartFile(
//               'photo',
//               http.ByteStream(
//                 DelegatingStream.typed(
//                   _image.openRead(),
//                 ),
//               ),
//               await _image.length(),
//               filename: basename(_image.path),
//             ),
//           );
//         }

//         request.fields['email'] = emailController.text ?? emailController.text;
//         request.fields['name'] = nameController.text;
//         request.fields['mobile'] = mobileController.text;
//         request.fields['alternate_phone'] = alternativeMobileController.text;
//         request.fields['education'] = educationController.text;
//         request.fields['address_line_one'] = add1Controller.text;
//         request.fields['address_line_two'] = add2Controller.text;
//         request.fields['date_of_birth'] = dobController.text;
//         request.fields['joining_reason'] = joiningresonController.text;
//         request.fields['interest_cat_ids'] = interest_cat_ids.text;
//         request.fields['zipcode'] = zipController.text;

//         if (studentController.selectedCountry == null) {
//           showToast('please choose a Country', red);
//         } else if (studentController.selectedState == null) {
//           showToast('please choose a State', red);
//         } else if (studentController.selectedCity == null) {
//           showToast('please choose a city', red);
//         } else {
//           request.fields['country'] =
//               studentController.selectedCountry?.id.toString();
//           request.fields['state'] =
//               studentController.selectedState?.id.toString();
//           request.fields['city'] =
//               studentController.selectedCity?.id.toString();
//         }

//         // studentController.selectedCountry?.id != null
//         //     ? request.fields['country'] =
//         //         studentController.selectedCity?.id.toString()
//         //     : request.fields['country'] = editStudentProfileController
//         //         .profileData['country_id']
//         //         .toString();
//         // studentController.selectedState?.id != null
//         //     ? request.fields['state'] =
//         //         studentController.selectedCity?.id.toString()
//         //     : request.fields['state'] =
//         //         editStudentProfileController.profileData['state_id'].toString();
//         // studentController.selectedCity?.id != null
//         //     ? request.fields['city'] =
//         //         studentController.selectedCity?.id.toString()
//         //     : request.fields['city'] =
//         //         editStudentProfileController.profileData['city_id'].toString();
//         // print('name ${studentController.selectedCountry?.name}');
//         // print('id ${studentController.selectedCountry?.id.toString()}');
//         // print('id ${request.fields['country']}');
//         // print('city ${request.fields['city']}');
//         // print(
//         //     'id ${editStudentProfileController.profileData['country_id'].toString()}');

//         try {
//           var response = await networkcallService.saveUserDetails(request);
//           if (response['status'] == 'success') {
//             Get.back();
//           }

//           setState(() {
//             isLoading = false;
//           });
//           // print(response);
//         } catch (e) {
//           setState(() {
//             isLoading = false;
//           });
//           e is CustomError
//               ? throw CustomError(e.errorMessage())
//               : throw CustomError(INTERNET_ERROR);
//         }
//       }
//     }
//   }

//   Widget _getSignUpForm(_height) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//                 height: _height,
//                 icon: Icons.account_circle_outlined,
//                 hintText: 'Name',
//                 controller: nameController,
//                 color: grayColor,
//                 borderColor: backgroundColor,
//                 validationFunction: (value) {
//                   // if (value.isEmpty) {
//                   //   return "Enter Valid Full Name ";
//                   // } else if (value.trim().isEmpty) {
//                   //   return "Enter Valid Full Name ";
//                   // }
//                 }),
//           ),
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 readOnly: true,
//                 controller: emailController,
//                 validator: (value) {
//                   // if (value.isEmpty) {
//                   //   return "Enter Valid Full Name ";
//                   // } else if (value.trim().isEmpty) {
//                   //   return "Enter Valid Email id ";
//                   // }
//                 },
//                 style: customizeTextStyle(FontWeight.w500, 0.05.sw, grayColor),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(
//                     Icons.contact_mail,
//                     color: backgroundColor,
//                     size: 0.06.sw,
//                   ),
//                   hintText: 'Email Id',
//                   hintStyle:
//                       customizeTextStyle(FontWeight.w500, 0.04.sw, blueColor),
//                   contentPadding: EdgeInsets.all(15),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: backgroundColor),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: backgroundColor),
//                   ),
//                 ),
//               )),
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.phone,
//               hintText: 'Phone Number',
//               controller: mobileController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Phone number ";
//                 }
//               },
//             ),
//           ),
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.phone,
//               hintText: 'Alternative Phone Number',
//               controller: alternativeMobileController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Alternative Phone number ";
//                 }
//               },
//             ),
//           ),
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.location_pin,
//               hintText: 'Address Line One',
//               controller: add1Controller,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Address Line One ";
//                 }
//               },
//             ),
//           ),
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.location_pin,
//               hintText: 'Address Line Two',
//               controller: add2Controller,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Address Line Two ";
//                 }
//               },
//             ),
//           ),
//           //education field
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.cast_for_education,
//               hintText: 'education',
//               controller: educationController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Phone number ";
//                 }
//               },
//             ),
//           ),
//           //Date of Birth
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.date_range,
//               hintText: 'Date of Birth',
//               controller: dobController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Phone number ";
//                 }
//               },
//             ),
//           ),
//           //Joining reason
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.note_add,
//               hintText: 'Joining reason',
//               controller: joiningresonController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Phone number ";
//                 }
//               },
//             ),
//           ),
//           //interest_cat_ids
//           SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SigninSignUpWidget().customTextField(
//               height: _height,
//               icon: Icons.person_pin_circle_rounded,
//               hintText: 'zip Code',
//               controller: zipController,
//               color: black,
//               borderColor: backgroundColor,
//               validationFunction: (value) {
//                 // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                 // RegExp regExp = new RegExp(patttern);
//                 if (value.isEmpty || value.trim().isEmpty) {
//                   return "Enter Valid Phone number ";
//                 }
//               },
//             ),
//           ),

// //This to for country list , it need to be transfered from the below style
//           // SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: SigninSignUpWidget().customTextField(
//           //     height: _height,
//           //     icon: Icons.vpn_key_outlined,
//           //     hintText: 'Select your country',
//           //     controller: mobileController,
//           //     color: black,
//           //     borderColor: backgroundColor,
//           //     validationFunction: (value) {
//           //       // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//           //       // RegExp regExp = new RegExp(patttern);
//           //       if (value.isEmpty || value.trim().isEmpty) {
//           //         return "Enter Valid Phone number ";
//           //       }
//           //     },
//           //   ),
//           // ),

// //******************** */

//           Container(
//             height: 0.08.sh,
//             width: 1.sw,
//             //color: Colors.blue,
//             decoration: BoxDecoration(
//               //color: const Color(0xff7c94b6),
//               // border: Border.all(
//               //   color: white,
//               //   width: 1,
//               // ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                   key: UniqueKey(),
//                   dropdownColor: backgroundColor,
//                   // isExpanded: true,
//                   hint: Text(
//                     studentController.initialCountry?.value ?? 'Country',
//                     style: TextStyle(
//                       color: blueColor,
//                     ),
//                   ),
//                   value: studentController.selectedCountry,
//                   icon: Icon(
//                     Icons.arrow_drop_down_outlined,
//                     size: 0.07.sw,
//                     color: blueColor,
//                   ),
//                   style: TextStyle(color: blueColor),
//                   items: studentController.listOfCountry.map((value) {
//                     return DropdownMenuItem(
//                       value: value,
//                       child: Text(
//                         value.name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: blueColor),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) {
//                     studentController.setDefaultCountry(newValue);
//                     studentController
//                         .fetchStateList(studentController.selectedCountry.id);
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 8.0, right: 8),
//             child: Divider(
//               color: blueColor,
//               height: .01.sh,
//             ),
//           ),
// //state
//           Container(
//               height: 0.08.sh,
//               width: 1.sw,
//               decoration: BoxDecoration(
//                 //   color: const Color(0xff7c94b6),
//                 // border: Border.all(
//                 //   color: blueColor,
//                 //   width: 1,
//                 // ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton(
//                     key: UniqueKey(),
//                     // isExpanded: true,
//                     dropdownColor: backgroundColor,
//                     hint: Text(studentController.initialState?.value ?? 'State',
//                         style: TextStyle(
//                           color: blueColor,
//                         )),
//                     value: studentController.selectedState,
//                     icon: Icon(
//                       Icons.arrow_drop_down_outlined,
//                       size: 0.07.sw,
//                       color: blueColor,
//                     ),
//                     style: TextStyle(color: blueColor),
//                     items: studentController.listOfState.map((value) {
//                       return DropdownMenuItem(
//                         value: value,
//                         child: Text(
//                           value.name,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: blueColor),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       studentController.setDefaultState(newValue);
//                       studentController
//                           .fetchCityList(studentController.selectedState.id);
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               )),
//           Padding(
//             padding: EdgeInsets.only(left: 8.0, right: 8),
//             child: Divider(
//               color: blueColor,
//               height: .01.sh,
//             ),
//           ),
// //city
//           Container(
//               height: 0.08.sh,
//               width: 1.sw,
//               decoration: BoxDecoration(
//                 //   color: const Color(0xff7c94b6),
//                 // border: Border.all(
//                 //   color: blueColor,
//                 //   width: 1,
//                 // ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton(
//                     key: UniqueKey(),
//                     // isExpanded: true,
//                     dropdownColor: backgroundColor,
//                     hint: Text(studentController.initialcity?.value ?? 'City',
//                         style: TextStyle(
//                           color: blueColor,
//                         )),
//                     value: studentController.selectedCity,
//                     icon: Icon(
//                       Icons.arrow_drop_down_outlined,
//                       size: 0.07.sw,
//                       color: blueColor,
//                     ),
//                     style: TextStyle(color: blueColor),
//                     items: studentController.listOfCity.map((value) {
//                       return DropdownMenuItem(
//                         value: value,
//                         child: Text(
//                           value.name,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: blueColor),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       studentController.setDefaultCity(newValue);

//                       setState(() {});
//                     },
//                   ),
//                 ),
//               )),
//           Padding(
//             padding: EdgeInsets.only(left: 8.0, right: 8),
//             child: Divider(
//               color: blueColor,
//               height: .01.sh,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future imagePicker() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//         });
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   // Future<void> _updateProfile(
//   //   user_email,
//   //   password,
//   //   phone_number,
//   //   image_url
//   // ) async {

//   // }
// }
