import 'package:shared_preferences/shared_preferences.dart';
class SharePreferenceInstance {
  static SharedPreferences? prefs;

  static final SharePreferenceInstance sp =
      new SharePreferenceInstance._internal();

  SharePreferenceInstance._internal();

  factory SharePreferenceInstance() {
    return sp;
  }
  //shared pref initialize
  init() async {
    await SharedPreferences.getInstance()
        .then((value) => prefs = value)
        .catchError((e) {
      print("Got error: ${e.error}"); // Finally, callback fires.
      // Future completes with 42.
    });
    // print(prefs);
  }

  void clear() {
    prefs?.clear();
  }

  //keys
  final ISLOGIN = 'isLogin';
  final USER_TOKEN = 'user_token';
  final User_NAME = 'User_NAME';
  final User_EMAIL = 'User_Email';
  final User_ID = 'User_ID';
  final PROFILE_PHOTO_PATH = 'profile_photo_path';
  final _ABOUTUS = 'about_us';
  final String _musicList = 'musiclist';
  final String _musicIndex = 'musicIndex';

  //isLogin
  void setIsLogin(value) => prefs?.setBool(ISLOGIN, value);
  bool? isLogin() => prefs?.getBool(ISLOGIN);

//-----------------------------userId---------------------------
  setuserId(value) {
    prefs!.setString(User_ID, value);
  }

  getuserId() {
    return prefs!.getString(User_ID);
  }

  //token
  void setToken(token) => prefs?.setString(USER_TOKEN, token);
  String? getToken() => prefs?.getString(USER_TOKEN);

  //check_User_Role
  void setName(role) => prefs?.setString(User_NAME, role);
  String? getName() => prefs?.getString(User_NAME);

  //check_User_Role
  void setEmail(role) => prefs?.setString(User_EMAIL, role);
  String? getEmail() => prefs?.getString(User_EMAIL);

  //check_User_Role
  void setUserId(role) => prefs?.setInt(User_ID, role);
  int? getUserId() => prefs?.getInt(User_ID);

  // profilePhoto
  void setprofilePath(value) => prefs?.setString(PROFILE_PHOTO_PATH, value);
  String? getProfilePath() => prefs?.getString(PROFILE_PHOTO_PATH);

  //aboutus
  void setAboutUs(value) => prefs?.setString(_ABOUTUS, value);
  String? getAboutUs() => prefs?.getString(_ABOUTUS);

  // //musicList
  // void setMusicList(value) => prefs?.setString(_musicList, value);
  // String? getMusicList() => prefs?.getString(_musicList);

  // //musicIndex
  // void setMusicIndex(value) => prefs?.setInt(_musicIndex, value);
  // int? getMusicIndex() => prefs?.getInt(_musicIndex);

  void saveUserDetails(jsonResponce) {
    setName(jsonResponce['data']['name']);
    setEmail(jsonResponce['data']['email']);
    setToken(jsonResponce['data']['api_token']);
    setUserId(jsonResponce['data']['id']);
    setprofilePath(jsonResponce['data']['profile_photo']['name']);
    setIsLogin(true);
  }
}

SharePreferenceInstance sharePrefereceInstance = SharePreferenceInstance();
