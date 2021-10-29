import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//==========================Text============================================

/* ---------------------- image -------------*/
String logo = 'assets/logo.png';
String logo1 = 'assets/logo1.png';
String profile = 'assets/profile.png';
String lady = 'assets/lady.png';

String google = 'assets/google.svg';
String leftImg = 'assets/left_side.svg';
String rightImg = 'assets/right_side.svg';
String PricingVector = 'assets/PricingVector.png';

String onboard1 = 'assets/onboard1.png';
String onboard2 = 'assets/onboard2.png';
String onboard3 = 'assets/onboard3.png';

String img =
    'https://th.bing.com/th/id/OIP.sLhhcXmEs6n2HaBDrxetRwHaNK?pid=ImgDet&rs=1';
/*-------------------------custom text-------------------------*/
TextStyle customizeTextStyle(
        fontWeight, fontSize, fontColor) =>
    GoogleFonts.roboto(
        textStyle: TextStyle(
            fontWeight: fontWeight,
            wordSpacing: 3,
            color: fontColor,
            fontSize: fontSize));

// Widget customText(String text, Color color, double size, FontWeight w700, {fontWeight}) {
//   return Text(text,
//       style: GoogleFonts.roboto(
//           textStyle:
//               TextStyle(fontSize: size, color: color, fontWeight: fontWeight)));
// }

Widget customInkWellText(
    Function() onTap, String text, Color color, double size,
    {fontWeight}) {
  return InkWell(
    onTap: onTap,
    child: Text(text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight)),
  );
}

Widget customRichText(String text1, text2, text3) => RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(text: text1, style: TextStyle(color: black)),
          TextSpan(text: text2, style: TextStyle(color: mainColor)),
          TextSpan(text: text3, style: TextStyle(color: black))
        ],
      ),
      textScaleFactor: 0.5,
    );

Widget customUnderlineText(String text, Color color, double size,
    {fontWeight}) {
  return Text(text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ));
}

/// ------------------ color ----------------

const kPrimaryColor = Color(0xffFF7D13);
const kSecColor = Color(0xff090927);
const kThirdColor = Color(0xff003B71);
const kPrimaryGradientColor = LinearGradient(
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
  //stops: [0.1, 2.0],
  colors: [Color(0xFFFFD7B7), Color(0xFFFFFFFF)],
);

final Color backGroundColor = Color(0xff090927);
final Color primaryColor = Color(0xff3A3A3A);
final Color commonColor = Color(0xff090927);
const kButtonColor = Color(0xFF3C2C2C);
const kTextColor = Color(0xFF1A1A1A);
const white = Color(0xFFFFFFFF);
const border = Color(0xFFDBDBDB);
const unselect = Color(0xFFB1B1B1);
final Color lightBlack = Colors.black54;
const kAnimationDurkThirdColoration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);
final Color mainColor = Color(0xffFF7D13);
// final Color primaryColor = Color(0xff3A3A3A);
final Color secondryColor = Color(0xff003B71);
// final Color commonColor = Color(0xff090927);
final Color activeColor = Color(0xff22E11E);
final Color textColor = Color(0xff969696);
// final Color backGroundColor = Color(0xffffe0e0);
final Color bg = Color.fromRGBO(255, 245, 243, 1);
final Color violet = Colors.purple;
final Color indigo = Colors.indigo;
final Color black = Colors.black;
// final Color lightBlack = Colors.black54;
final Color grey = Colors.grey;
final Color yellow = Colors.yellow;
final Color orange = Colors.orange;
final Color red = Colors.red;
// final Color white = Colors.white;
final FontWeight extraBoldTextWeight = FontWeight.w700;
final FontWeight boldTextWeight = FontWeight.w600;
final FontWeight mediumTextWeight = FontWeight.w500;
final FontWeight thinTextWeight = FontWeight.w400;
final FontWeight extraThinTextWeight = FontWeight.w300;
final Color backgroundColor = Color(0xff1ca3fd);
final Color loginButtonColor = Color(0xff01e0ff);
final Color lightWhite = Color(0xfffcf2f2);
final Color green = Color(0xff336600);
final Color colorGreenAccent = Color(0xff00ff00);
final Color primaryColor2 = Color(0xFFfffbd5);
final Color grayColor = Color(0xFF6B7278);
final Color blueColor = Color(0xFF044fc8);
final Color darkRedColor = Color(0xFF6B7278);
final Color thinGrayColor = Color(0xFF6B7278);
final Color lightGrayColor = Color(0xFF6B7278);
final Color lightBlackBoldColor = Color(0xFF6B7278);
/*-------------------------Fluttertoast-------------------------*/

showToast(msg, color) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: white,
    fontSize: 16.0);

//------------------------------progress-----------------------------------

void showProgress() {
  Get.defaultDialog(
    content: CupertinoActivityIndicator(
      radius: 25.r,
    ),
  );
}

void hideProgress() {
  Get.back();
}

//-------------------------input decoration--------------------

InputDecoration myInputDecoration(
    {required String hintText, Widget? suffixIcon}) {
  return InputDecoration(
    hintText: hintText,
    labelText: hintText,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 20,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: border,
      ),
      gapPadding: 10,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: border,
      ),
      gapPadding: 10,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: border,
      ),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: border,
      ),
      gapPadding: 10,
    ),
    suffixIcon: suffixIcon,
  );
}

//-------------------------customText--------------------

Widget customText(String text, Color textColor, double size, fontWeight) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: size,
      fontWeight: fontWeight,
    ),
  );
}

//------------------------------show message---------------------------
void showSnack(String msg,
    {String title = 'Alert',
    Color background = Colors.red,
    Color color = white}) {
  Get.snackbar(title, msg, backgroundColor: background, colorText: color);
}

//----------------------------network--------------------------
String internetError = 'No Internet Connection';
String baseUrl = 'https://demo39.gowebbi.us/api/';
String registerApi1 = baseUrl + 'RegistrationApi/Registration';
String loginApi = baseUrl + 'LoginApi/Login';
String divisionApi = baseUrl + 'RegistrationApi/FetchDivision';
String casteSubCasteApi = baseUrl + 'RegistrationApi/FetchCasteSubCaste';
String hobbiesApi = baseUrl + 'RegistrationApi/FetchHobbies';
String countryApi = baseUrl + 'RegistrationApi/FetchCountry';
String stateApi = baseUrl + 'RegistrationApi/FetchState';
String cityApi = baseUrl + 'RegistrationApi/FetchCity';
String prefLocApi = baseUrl + 'RegistrationApi/FetchPrefLoc';
String fetchProfile = baseUrl + 'ProfileApi/FetchProfile';
// String otpVerifyApi = baseUrl + 'otp-verify-register';

//----------------------------keys--------------------------
String API_SUCCESS = 'success';
String API_FAILED = 'failed';
final String INTERNET_ERROR = "We are faceing an error";
