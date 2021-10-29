class PreflocModel {
  String? status;
  String? msg;
  List<PreflocData>? data;
  PreflocModel({this.status, this.msg, this.data});
  PreflocModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PreflocData>[];
      json['data'].forEach((v) {
        data!.add(new PreflocData.fromJson(v));
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

class PreflocData {
  int? id;
  String? preferableLoc;

  PreflocData({this.id, this.preferableLoc});

  PreflocData.fromJson(Map<String, dynamic> json) {
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
