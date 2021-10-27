import 'package:get/get.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';
import 'package:matrimonial/view/Profile/profileModel.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  var profileModel = ProfileModel().obs;

  //fetchProfileDetails -------------------------------------------
  Future fetchProfileDetails({required int profileId}) async {
    try {
      var apiData =
          await networkcallService.fetchProfileData(profileId: profileId);
      profileModel.value = apiData;
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }
}
