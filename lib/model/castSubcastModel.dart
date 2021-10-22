class CastSubcastModel {
  List<CasteList>? casteList;

  CastSubcastModel({this.casteList});

  CastSubcastModel.fromJson(Map<String, dynamic> json) {
    if (json['CasteList'] != null) {
      casteList = <CasteList>[];
      json['CasteList'].forEach((v) {
        casteList?.add(new CasteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.casteList != null) {
      data['CasteList'] = this.casteList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CasteList {
  String? casteId;
  String? casteName;
  List<Subcastelist>? subcastelist;

  CasteList({this.casteId, this.casteName, this.subcastelist});

  CasteList.fromJson(Map<String, dynamic> json) {
    casteId = json['Caste_Id'];
    casteName = json['Caste_Name'];
    if (json['subcastelist'] != null) {
      subcastelist = <Subcastelist>[];
      json['subcastelist'].forEach((v) {
        subcastelist?.add(new Subcastelist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Caste_Id'] = this.casteId;
    data['Caste_Name'] = this.casteName;
    if (this.subcastelist != null) {
      data['subcastelist'] = this.subcastelist?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcastelist {
  String? subCasteId;
  String? subCasteName;

  Subcastelist({this.subCasteId, this.subCasteName});

  Subcastelist.fromJson(Map<String, dynamic> json) {
    subCasteId = json['SubCaste_Id'];
    subCasteName = json['SubCaste_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubCaste_Id'] = this.subCasteId;
    data['SubCaste_Name'] = this.subCasteName;
    return data;
  }
}
