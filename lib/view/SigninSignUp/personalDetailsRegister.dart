// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:usrishtey/components/DefaultButton.dart';
// import 'package:usrishtey/constants.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:usrishtey/network/api.dart';

// class PersonalDetails extends StatefulWidget {
//   const PersonalDetails({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<PersonalDetails> createState() => _PersonalDetailsState();
// }

// String _selectedValue = 'A';

// class _PersonalDetailsState extends State<PersonalDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 32.h),
//           customText("PersonalDetails", kThirdColor, 16.sp, FontWeight.w700),
//           SizedBox(height: 25.h),
//           DropdownButtonFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                   // borderSide:  ,
//                 ),
//               ),
//               value: _selectedValue,
//               isExpanded: true,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedValue = value as String;
//                 });
//               },
//               items: [
//                 DropdownMenuItem(child: Text('Relegion'), value: 'A'),
//                 DropdownMenuItem(child: Text('B'), value: 'B'),
//                 DropdownMenuItem(child: Text('C'), value: 'C')
//               ]),
//           SizedBox(height: 25.h),
//           TextFormField(decoration: myInputDecoration(hintText: 'Password')),
//           SizedBox(
//               width: 1.sw,
//               height: 50.h,
//               child: DefaultButton(text: "Next", press: () {}))
//         ],
//       ),
//     );
//   }
// }
