import 'package:get/get.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';

class PersonalDetailsRegisterController extends GetxController {
  var isLoading = true.obs;
  //country
  var castSubcastModel = CastSubcastModel().obs;
  var listOfCastSubcast = <CasteList>[].obs;
  var selectedRelegion;
  var initialCountry = 'select your country *'.obs;

  onDispose() {
    listOfCastSubcast.clear();
  }

  // clearData() {
  //   listOfCastSubcast = null;
  // }

  //fetchCountryList-------------------------------------------
  fetchCastList() async {
    try {
      showProgress();
      var apiData = await networkcallService.fetchcastSubcast();
      if (apiData != null) {
        castSubcastModel.value = apiData;
        // listOfCountry.clear();
        // listOfCastSubcast.assignAll(castSubcastModel.value.casteList);
      }
    } catch (e) {
      if (e is CustomError) {
        print(e);
        isLoading.value = false;
        showToast(e.customMessage, red);
      }
    }
  }

// /////fetchStateList------------------------------------------------------------
//   fetchStateList(countryId) async {
//     try {
//       selectedState = null;
//       selectedCity = null;
//       var listOfStatefromApi = await Networkcall().fetchStateList(countryId);
//       listOfState.assignAll(listOfStatefromApi.data);
//     } catch (e) {
//       print(e);
//       isLoading.value = false;
//       if (e.isNetworkError != null && e.isNetworkError) {
//         showToast(e.customMessage, red);
//       } else {
//         showToast(e.customMessage, red);
//       }
//     }
//   }

// ////fetchCityList-------------------------------------------------------------
//   fetchCityList(cityId) async {
//     selectedCity = null;
//     try {
//       isLoading.value = true;
//       var listOfCityfromApi = await Networkcall().fetchCityList(cityId);
//       listOfCity.assignAll(listOfCityfromApi.data);
//       listOfCity.refresh();
//     } catch (e) {
//       print(e);
//       isLoading.value = false;
//       if (e.isNetworkError != null && e.isNetworkError) {
//         showToast(e.customMessage, red);
//       } else {
//         showToast(e.customMessage, red);
//       }
//     }
//   }

//   setDefaultCountry(newValue) {
//     selectedCountry = newValue;
//   }

//   setDefaultState(newValue) {
//     selectedState = newValue;
//   }

//   setDefaultCity(newValue) {
//     selectedCity = newValue;
//   }
}
