class ProfileModel {
  String? status;
  String? msg;
  List<ProfileData>? data;

  ProfileModel({this.status, this.msg, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data =<ProfileData>[];
      json['data'].forEach((v) {
        data!.add(new ProfileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileData {
  int? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNo;
  String? example;
  String? gender;
  String? password;
  String? religion;
  String? language;
  String? division;
  String? otherCommu;
  String? caste;
  String? subCaste;
  String? dosh;
  String? imgURL;
  String? maritalStatus;
  String? children;
  String? heightFt;
  String? heightInch;
  String? familyStatus;
  String? familyType;
  String? familyValues;
  String? disability;
  String? education;
  String? occupation;
  String? currency;
  String? annualIncome;
  String? employedIn;
  String? country;
  String? state;
  String? city;
  String? citizenship;
  String? residentialSts;
  String? aboutYourself;
  String? ondate;
  String? divisionName;
  String? casteName;
  String? subCasteName;
  String? cID;
  String? sID;
  String? cityID;
  int? age;
  String? personality;
  String? familyBackground;
  String? eatingHabits;
  String? smoking;
  String? drinking;
  String? hobbies;
  String? preferableLoc;
  String? starSign;

  ProfileData(
      {this.id,
      this.fullName,
      this.firstName,
      this.lastName,
      this.email,
      this.contactNo,
      this.example,
      this.gender,
      this.password,
      this.religion,
      this.language,
      this.division,
      this.otherCommu,
      this.caste,
      this.subCaste,
      this.dosh,
      this.imgURL,
      this.maritalStatus,
      this.children,
      this.heightFt,
      this.heightInch,
      this.familyStatus,
      this.familyType,
      this.familyValues,
      this.disability,
      this.education,
      this.occupation,
      this.currency,
      this.annualIncome,
      this.employedIn,
      this.country,
      this.state,
      this.city,
      this.citizenship,
      this.residentialSts,
      this.aboutYourself,
      this.ondate,
      this.divisionName,
      this.casteName,
      this.subCasteName,
      this.cID,
      this.sID,
      this.cityID,
      this.age,
      this.personality,
      this.familyBackground,
      this.eatingHabits,
      this.smoking,
      this.drinking,
      this.hobbies,
      this.preferableLoc,
      this.starSign});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fullName = json['FullName'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    contactNo = json['ContactNo'];
    example = json['Example'];
    gender = json['Gender'];
    password = json['Password'];
    religion = json['Religion'];
    language = json['Language'];
    division = json['Division'];
    otherCommu = json['OtherCommu'];
    caste = json['Caste'];
    subCaste = json['SubCaste'];
    dosh = json['Dosh'];
    imgURL = json['ImgURL'];
    maritalStatus = json['MaritalStatus'];
    children = json['Children'];
    heightFt = json['HeightFt'];
    heightInch = json['HeightInch'];
    familyStatus = json['FamilyStatus'];
    familyType = json['FamilyType'];
    familyValues = json['FamilyValues'];
    disability = json['Disability'];
    education = json['Education'];
    occupation = json['Occupation'];
    currency = json['Currency'];
    annualIncome = json['AnnualIncome'];
    employedIn = json['EmployedIn'];
    country = json['Country'];
    state = json['State'];
    city = json['City'];
    citizenship = json['Citizenship'];
    residentialSts = json['ResidentialSts'];
    aboutYourself = json['AboutYourself'];
    ondate = json['Ondate'];
    divisionName = json['DivisionName'];
    casteName = json['CasteName'];
    subCasteName = json['SubCasteName'];
    cID = json['CID'];
    sID = json['SID'];
    cityID = json['CityID'];
    age = json['Age'];
    personality = json['Personality'];
    familyBackground = json['FamilyBackground'];
    eatingHabits = json['EatingHabits'];
    smoking = json['Smoking'];
    drinking = json['Drinking'];
    hobbies = json['Hobbies'];
    preferableLoc = json['PreferableLoc'];
    starSign = json['StarSign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FullName'] = this.fullName;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['ContactNo'] = this.contactNo;
    data['Example'] = this.example;
    data['Gender'] = this.gender;
    data['Password'] = this.password;
    data['Religion'] = this.religion;
    data['Language'] = this.language;
    data['Division'] = this.division;
    data['OtherCommu'] = this.otherCommu;
    data['Caste'] = this.caste;
    data['SubCaste'] = this.subCaste;
    data['Dosh'] = this.dosh;
    data['ImgURL'] = this.imgURL;
    data['MaritalStatus'] = this.maritalStatus;
    data['Children'] = this.children;
    data['HeightFt'] = this.heightFt;
    data['HeightInch'] = this.heightInch;
    data['FamilyStatus'] = this.familyStatus;
    data['FamilyType'] = this.familyType;
    data['FamilyValues'] = this.familyValues;
    data['Disability'] = this.disability;
    data['Education'] = this.education;
    data['Occupation'] = this.occupation;
    data['Currency'] = this.currency;
    data['AnnualIncome'] = this.annualIncome;
    data['EmployedIn'] = this.employedIn;
    data['Country'] = this.country;
    data['State'] = this.state;
    data['City'] = this.city;
    data['Citizenship'] = this.citizenship;
    data['ResidentialSts'] = this.residentialSts;
    data['AboutYourself'] = this.aboutYourself;
    data['Ondate'] = this.ondate;
    data['DivisionName'] = this.divisionName;
    data['CasteName'] = this.casteName;
    data['SubCasteName'] = this.subCasteName;
    data['CID'] = this.cID;
    data['SID'] = this.sID;
    data['CityID'] = this.cityID;
    data['Age'] = this.age;
    data['Personality'] = this.personality;
    data['FamilyBackground'] = this.familyBackground;
    data['EatingHabits'] = this.eatingHabits;
    data['Smoking'] = this.smoking;
    data['Drinking'] = this.drinking;
    data['Hobbies'] = this.hobbies;
    data['PreferableLoc'] = this.preferableLoc;
    data['StarSign'] = this.starSign;
    return data;
  }
}
