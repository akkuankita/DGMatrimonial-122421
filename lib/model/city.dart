class CityModel {
  String? status;
  String? msg;
  List<Data>? data;

  CityModel({this.status, this.msg, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? sID;
  String? city;
  String? status;

  Data({this.id, this.sID, this.city, this.status});
  Data.fromJson(Map<String, dynamic> json) {
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
