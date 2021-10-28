import 'dart:async';
import 'package:get/get.dart';
//import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/sharePreference_instance.dart';

enum ApplicationState { applicationRunning, LoggedIn, LoggedOut }

class ApplicationStarterController extends GetxController {
  var state = ApplicationState.applicationRunning.obs;

  StreamSubscription? intentDataStreamSubscription;
  // List<SharedMediaFile> _sharedFiles;
  String? sharedText;

  @override
  void onInit() async {
    // await
    initializeApplicationState();

    super.onInit();
  }

  initializeApplicationState() {
    // Future.delayed(const Duration(seconds: 0), () {
    // print('applicationState ${sharePrefereceInstance.isLogin()}');
    if (sharePrefereceInstance.isLogin() != null &&
        sharePrefereceInstance.isLogin()!) {
      state.value = ApplicationState.LoggedIn;
    } else
      state.value = ApplicationState.LoggedOut;
    // });
  }


}
