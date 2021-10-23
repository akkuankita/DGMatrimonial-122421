class HobbiesModel {
  String? status;
  String? msg;
  List<HobbieData>? data;

  HobbiesModel({this.status, this.msg, this.data});

  HobbiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data =  <HobbieData>[];
      json['data'].forEach((v) {
        data!.add(new HobbieData.fromJson(v));
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

class HobbieData {
  int? id;
  String? hobbies;

  HobbieData({this.id, this.hobbies});

  HobbieData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hobbies = json['Hobbies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Hobbies'] = this.hobbies;
    return data;
  }
}
