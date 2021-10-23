import 'package:get/get.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/model/hobbies.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';

class PersonalDetailsRegisterController extends GetxController {
  var isLoading = true.obs;
  
  var castSubcastModel = CastSubcastModel().obs;
  var listOfCastSubcast = <CasteList>[].obs;
  var listOfSubcast = <Subcastelist>[].obs;
  var selectedCast;
  var selectedSubcast;

  var hobbiesModel = HobbiesModel().obs;
  var hobbiesList = <HobbieData>[].obs;
  var selectedHobbies;

  @override
  void onInit() {
    super.onInit();
  }

  // clearData() {
  //   listOfCastSubcast = null;
  // }

  //fetchCastList -------------------------------------------
  Future fetchCastList() async {
    try {
    listOfCastSubcast.clear();
      selectedSubcast = null;
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

  //fetchHobbie -------------------------------------------
  Future fetchHobbie() async {
    try {
    hobbiesList.clear();
      var apiData = await networkcallService.fetchcastSubcast();
      if (apiData != null) {
        // hobbiesModel.value = apiData;
        // listOfCountry.clear();
        hobbiesList.assignAll(hobbiesModel.value.data!);
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
    List<Subcastelist> subCust = [];
    var sc = castSubcastModel.value.casteList!.map((e) {
      if (e.casteId == castId) {
        if (e.subcastelist!.isNotEmpty) {
          subCust.assignAll(e.subcastelist!);
          return e.subcastelist;
        }
      }
    }).toList();
    if(subCust.isNotEmpty){
    listOfSubcast.assignAll(subCust);
    selectedSubcast = listOfSubcast[0];
    }else{
      listOfSubcast.clear();
      selectedSubcast = null;
    }
  }

  //fetchCountryList-------------------------------------------
  changeSelectedCast(value) async {
    var cast = value;
    selectedCast = value;
    fetchSubcastList(cast.casteId!);
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
