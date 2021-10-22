class DivisionModel {
  String? status;
  String? msg;
  List<Data>? data;

  DivisionModel({this.status, this.msg, this.data});

  DivisionModel.fromJson(Map<String, dynamic> json) {
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
  String? division;

  Data({this.id, this.division});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    division = json['Division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Division'] = this.division;
    return data;
  }
}


