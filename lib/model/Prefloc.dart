class Prefloc {
  String? status;
  String? msg;
  List<Data>? data;

  Prefloc({this.status, this.msg, this.data});

  Prefloc.fromJson(Map<String, dynamic> json) {
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
  String? preferableLoc;

  Data({this.id, this.preferableLoc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    preferableLoc = json['PreferableLoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['PreferableLoc'] = this.preferableLoc;
    return data;
  }
}