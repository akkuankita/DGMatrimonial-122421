import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect.dart';
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
    final myjson = response.body;
    if (response.statusCode == 200) {
      if (myjson['status'] == API_SUCCESS) {
        showSnack(myjson['msg']);
        sharePrefereceInstance.setIsLogin(true);
        // sharePref.setToken(myjson['data']['original']['access_token']);
        return true;
        } else {
          throw CustomError(myjson['msg']);
        }
      } else {
        throw CustomError(myjson['msg']);
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

  // >>>>>>>>>>>>>>>>>>>>>>>>>>> login <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
    final myjson = response.body;
    if (response.statusCode == 200) {
      if (myjson['status'] == API_SUCCESS) {
        showSnack(myjson['msg']);
        sharePrefereceInstance.setuserId(myjson['data'][0]['Id']);
        return myjson;
        } else {
          throw CustomError(myjson['msg']);
        }
      } else {
        throw CustomError(myjson['msg']);
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
