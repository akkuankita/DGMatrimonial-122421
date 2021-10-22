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
  var listOfSubcast = <Subcastelist>[].obs;
  var selectedCast;
  var selectedSubcast;
  var initialCountry = 'select your country *'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  onDispose() {
    listOfCastSubcast.clear();
  }

  // clearData() {
  //   listOfCastSubcast = null;
  // }

  //fetchCountryList-------------------------------------------
  Future fetchCastList() async {
    try {
      var apiData = await networkcallService.fetchcastSubcast();
      if (apiData != null) {
        castSubcastModel.value = apiData;
        // listOfCountry.clear();
        listOfCastSubcast.assignAll(castSubcastModel.value.casteList!);
        // selectedCast.value = listOfCastSubcast[0];
      }
    } catch (e) {
      if (e is CustomError) {
        print(e);
        isLoading.value = false;
        showToast(e.customMessage, red);
      }
    }
  }

  //fetchCountryList-------------------------------------------
  fetchSubcastList(String castId) async {
    var subCust;
    castSubcastModel.value.casteList!.where((element) {
      if (element.casteId == castId) {
        subCust = element.subcastelist;
      }
      return true;
    });
    listOfSubcast.assignAll(subCust);
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
