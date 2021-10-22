class Hobbies {
  String? status;
  String? msg;
  List<Data>? data;

  Hobbies({this.status, this.msg, this.data});

  Hobbies.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data =  <Data>[];
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
  String? hobbies;

  Data({this.id, this.hobbies});

  Data.fromJson(Map<String, dynamic> json) {
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