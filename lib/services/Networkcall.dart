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
import 'package:matrimonial/view/Profile/profileModel.dart';
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
    final param = {
      'email': email,
      'password': password,
    };
    try {
      showProgress();
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
  Future<bool> register({required body, required int registerNo}) async {
    showProgress();
    try {
      var response = await post(registerApi1, body);
      hideProgress();
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        if (myJson['status'] == API_SUCCESS) {
          showSnack(myJson['msg']);
          if (registerNo == 1) {
            sharePrefereceInstance.setuserId(myJson['data'][0]['Id']);
            sharePrefereceInstance.setToken(myJson['data'][0]['access_token']);
          }
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

// --------------------------------fetchcastSubcast--------------------------
  Future<CastSubcastModel> fetchcastSubcast() async {
    try {
      var response = await get(casteSubCasteApi);
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

  // ----------------------------fetchdivision--------------------------------
  Future<DivisionModel> fetchdivision() async {
    try {
      var response = await get(divisionApi);
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

// --------------------------------fetchcastSubcast--------------------------
  Future<ProfileModel> fetchProfileData({required int profileId}) async {
    try {
      var url = 'https://demo39.gowebbi.us/api/ProfileApi/FetchProfile?Id=154';
      var accesToken = 'Bearer ' +
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImRnMjNAZ21haWwuY29tIiwibmJmIjoxNjM1MjMxODczLCJleHAiOjE3Mjk5MjYyNzMsImlhdCI6MTYzNTIzMTg3M30.M-3RsAjv5TlUnF4Su5fOYZmrWvq_K1Lpf28i4Wr4IZQ';
      //  var accesToken = 'Bearer' + ${sharePrefereceInstance.getToken()};
      showProgress();
      var response = await get(url, headers: {
        'Authorization': '$accesToken',
        'accept': 'application/json'
      });
      hideProgress();
      print('res- ${response.body}-- ');
      final myJson = response.body;
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(myJson);
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
}

Networkcall networkcallService = Networkcall();
