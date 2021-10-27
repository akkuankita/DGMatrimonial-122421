class CountryModel {
  String? status;
  String? msg;
  List<CountryData>? data;

  CountryModel({this.status, this.msg, this.data});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data!.add(new CountryData.fromJson(v));
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

class CountryData {
  int? id;
  String? code;
  String? country;

  CountryData({this.id, this.code, this.country});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['Code'];
    country = json['Country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Code'] = this.code;
    data['Country'] = this.country;
    return data;
  }
}
