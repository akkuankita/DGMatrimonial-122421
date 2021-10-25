import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect.dart';
import 'package:matrimonial/model/Country.dart';
import 'package:matrimonial/model/Prefloc.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/model/city.dart';
import 'package:matrimonial/model/divisionModel.dart';
import 'package:matrimonial/model/hobbies.dart';
import 'package:matrimonial/model/state.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Networkcall extends GetConnect {
  static final Networkcall networkcall = new Networkcall._internal();

  Networkcall._internal();

  factory Networkcall() {
    return networkcall;
  }

  @override
  void onInit() {
    httpClient.timeout = Duration(seconds: 60);
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>> login <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> login({required String email, required String password}) async {
    String url = '$BASE_URL$login_google';
    // var headers = {
    //   'Accept': "application/json",
    // };
    // print(body);
    showProgress();
    final param = {
      'email': email,
      'password': password,
    };
    print(url);
    try {
      final response = await post(loginApi, param);
      hideProgress();
      print(response.body);
      print('res- ${response.body}-- $param');
      final myJson = response.body;
      if (response.statusCode == 200) {
        if (myJson['status'] == API_SUCCESS) {
          showSnack(myJson['msg']);
          sharePrefereceInstance.setIsLogin(true);
          // sharePref.setToken(myJson['data']['original']['access_token']);
          return true;
        } else {
          throw CustomError(myJson['msg']);
        }
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>> register <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> register(body) async {
    // var headers = {
    //   'Accept': "application/json",
    // };
    // print(body);
    showProgress();
    try {
      var response = await post(registerApi1, body);
      hideProgress();
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        if (myJson['status'] == API_SUCCESS) {
          showSnack(myJson['msg']);
          sharePrefereceInstance.setuserId(myJson['data'][0]['Id']);
          return true;
        } else {
          throw CustomError(myJson['msg']);
        }
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>> register <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> register2(body) async {
    try {
      showProgress();
      var response = await post(registerApi1, body);
      hideProgress();
      print('res- ${response.body}');
      final myJson = response.body;
      if (response.statusCode == 200) {
        if (myJson['status'] == API_SUCCESS) {
          return myJson;
        } else {
          throw CustomError(myJson['msg']);
        }
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

// --------------------------------register2--------------------------
  Future<CastSubcastModel> fetchcastSubcast() async {
    try {
      var response = await get(casteSubCasteApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return CastSubcastModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------register2--------------------------------
  Future<DivisionModel> fetchdivision() async {
    try {
      var response = await get(divisionApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return DivisionModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------fetchhobbies--------------------------------
  Future<HobbiesModel> fetchhobbies() async {
    try {
      var response = await get(hobbiesApi);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return HobbiesModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------register4--------------------------------
  Future<CountryModel> fetchCountry() async {
    try {
      var response = await get(countryApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return CountryModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------register4--------------------------------
  Future<StateModel> fetchState() async {
    try {
      var response = await get(stateApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return StateModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------register4--------------------------------
  Future<CityModel> fetchCity() async {
    try {
      var response = await get(cityApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return CityModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // ----------------------------register4--------------------------------
  Future<PreflocModel> fetchPrefloc() async {
    try {
      var response = await get(cityApi);
      print(response.body);
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return PreflocModel.fromJson(myJson);
      } else {
        throw CustomError(myJson['msg']);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

//---------------------------------otp verify---------------------------
  // Future<bool> otpVerification(
  //     {required String email,
  //     required String otp,
  //     required String usertype}) async {
  //   showProgress();
  //   var param = {'email': email, 'otp': otp};
  //   var response = await post(otpVerifyApi, param);
  //   hideProgress();
  //   print('otp res- ${response.body}');
  //   final myJson = response.body;
  //   if (response.statusCode == 200) {
  //     if (myJson['success']) {
  //       sharePref.setIsLogin(true);
  //       sharePref.setUsertype(usertype);
  //       sharePref.setToken(myJson['data']['original']['access_token']);
  //       return true;
  //     }
  //     return false;
  //   }
  //   return false;
  // }
}

Networkcall networkcallService = Networkcall();
