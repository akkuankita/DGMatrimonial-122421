import 'package:get/get.dart';
import 'package:matrimonial/model/Country.dart';
import 'package:matrimonial/model/Prefloc.dart';
import 'package:matrimonial/model/castSubcastModel.dart';
import 'package:matrimonial/model/city.dart';
import 'package:matrimonial/model/divisionModel.dart';
import 'package:matrimonial/model/hobbies.dart';
import 'package:matrimonial/model/state.dart';
import 'package:matrimonial/services/Networkcall.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/utils/error_handler.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  var castSubcastModel = CastSubcastModel().obs;
  var listOfCastSubcast = <CasteList>[].obs;
  var listOfSubcast = <Subcastelist>[].obs;
  var selectedCast;
  var selectedSubcast;

  var hobbiesModel = HobbiesModel().obs;
  var hobbiesList = <HobbieData?>[];
  var selectedHobbiesList = <HobbieData?>[];

  var divisionModel = DivisionModel().obs;
  var divisionList = <DivisionData>[].obs;
  var selectedDivision;

  //country
  var countryModel = CountryModel().obs;
  var listOfCountry = <CountryData>[].obs;
  var selectedCountry;
  //state
  var stateModel = StateModel().obs;
  var listOfState = <StateData>[].obs;
  var selectedState;
  //city
  var cityModel = CityModel().obs;
  var listOfCity = <CityData>[].obs;
  var selectedCity;

  //preflocModel
  var preflocModel = PreflocModel().obs;
  var listOfPrefloc = <PreflocData?>[];
  var selectedPreflocList = <PreflocData?>[];

  @override
  void onInit() {
    super.onInit();
  }

  //fetchCastList -------------------------------------------
  Future fetchCastList() async {
    try {
      listOfCastSubcast.clear();
      selectedSubcast = null;
      var apiData = await networkcallService.fetchcastSubcast();
      castSubcastModel.value = apiData;
      listOfCastSubcast.assignAll(castSubcastModel.value.casteList!);
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }

  //fetchHobbie -------------------------------------------
  Future fetchHobbie() async {
    try {
      hobbiesList.clear();
      var apiData = await networkcallService.fetchhobbies();

      hobbiesModel.value = apiData;
      hobbiesList.assignAll(hobbiesModel.value.data!);
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }

  //fetchDivision -------------------------------------------
  Future fetchDivision() async {
    try {
      divisionList.clear();
      var apiData = await networkcallService.fetchdivision();
      divisionModel.value = apiData;
      divisionList.assignAll(divisionModel.value.data!);
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }

  //fetchSubcastList-------------------------------------------
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
    if (subCust.isNotEmpty) {
      listOfSubcast.assignAll(subCust);
      selectedSubcast = listOfSubcast[0];
    } else {
      listOfSubcast.clear();
      selectedSubcast = null;
    }
  }

  //changeSelectedCast-------------------------------------------
  changeSelectedCast(value) async {
    var cast = value;
    selectedCast = value;
    fetchSubcastList(cast.casteId!);
  }

  //changeSelectedDivision-------------------------------------------
  changeSelectedDivision(value) async {
    selectedDivision = value;
  }

// fetchCountryList------------------------------------------------------------
  fetchCountryList() async {
    try {
      listOfCountry.clear();
      listOfState.clear();
      listOfCity.clear();
      countryModel.value = await networkcallService.fetchCountry();
      stateModel.value = await networkcallService.fetchState();
      cityModel.value = await networkcallService.fetchCity();

      listOfCountry.assignAll(countryModel.value.data!);
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }

  fetchStateList(countryId) async {
    listOfState.clear();
    listOfCity.clear();
    var tempCountryList = <StateData>[];
    var sc = stateModel.value.data!.map((e) {
      if (e.cID == countryId) {
        tempCountryList.add(e);
      }
    }).toList();
    if (tempCountryList.isNotEmpty) {
      listOfState.assignAll(tempCountryList);
      selectedState = listOfState[0];
    }
  }

  fetchCityList(stateId) async {
    listOfCity.clear();
    var tempCityList = <CityData>[];
    var sc = cityModel.value.data!.map((e) {
      if (e.sID == stateId) {
        tempCityList.add(e);
      }
    }).toList();
    if (tempCityList.isNotEmpty) {
      listOfCity.assignAll(tempCityList);
      selectedCity = listOfCity[0];
    }
  }

  //fetchCastList -------------------------------------------
  Future fetchPrefloc() async {
    try {
      var apiData = await networkcallService.fetchPrefloc();
      preflocModel.value = apiData;
      listOfPrefloc.assignAll(preflocModel.value.data!);
    } catch (e) {
      if (e is CustomError) {
        print(e);
        showToast(e.customMessage, red);
      }
    }
  }
}
