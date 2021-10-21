// import 'package:edustudio/Model/countryListModel.dart';
// import 'package:edustudio/util/constant.dart';
// import 'package:get/get.dart';
// import 'package:edustudio/services/Networkcall.dart';

// class StudentController extends GetxController {
//   var isLoading = true.obs;
//   //country
//   var countryModel = CountryModel().obs;
//   var listOfCountry = List<DataOfCountryModel>().obs;
//   var selectedCountry;
//   var initialCountry = 'select your country *'.obs;
//   // var selectedCountry = DataOfCountryModel().obs;
//   //state
//   var listOfState = List<DataOfStateModel>().obs;
//   var selectedState;
//   var initialState = 'select your state *'.obs;
//   //city
//   var listOfCity = List<DataOfCityModel>().obs;
//   var selectedCity;
//   var initialcity = 'select your city *'.obs;

//   onDispose() {
//     listOfCountry.clear();
//     listOfState.clear();
//     listOfCity.clear();
//   }

//   clearData() {
//     selectedCountry = null;
//     selectedState = null;
//     selectedCity = null;
//   }

//   //fetchCountryList-------------------------------------------
//   fetchCountryList() async {
//     try {
//       isLoading.value = true;
//       var listOfCountryfromApi = await Networkcall().fetchCountryList();
//       countryModel.value = listOfCountryfromApi;
//       // listOfCountry.clear();
//       listOfCountry.assignAll(countryModel.value.data);
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
// }
