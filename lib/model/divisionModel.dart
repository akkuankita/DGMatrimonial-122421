class DivisionModel {
  String? status;
  String? msg;
  List<DivisionData>? data;

  DivisionModel({this.status, this.msg, this.data});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DivisionData>[];
      json['data'].forEach((v) {
        data!.add(new DivisionData.fromJson(v));
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

class DivisionData {
  int? id;
  String? division;

  DivisionData({this.id, this.division});

  DivisionData.fromJson(Map<String, dynamic> json) {
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
