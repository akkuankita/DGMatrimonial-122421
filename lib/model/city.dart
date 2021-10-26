class CityModel {
  String? status;
  String? msg;
  List<CityData>? data;

  CityModel({this.status, this.msg, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(new CityData.fromJson(v));
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

class CityData {
  int? id;
  int? sID;
  String? city;
  String? status;

  CityData({this.id, this.sID, this.city, this.status});
  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sID = json['SID'];
    city = json['City'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['SID'] = this.sID;
    data['City'] = this.city;
    data['Status'] = this.status;
    return data;
  }
}
