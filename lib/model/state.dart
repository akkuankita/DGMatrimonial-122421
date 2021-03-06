class StateModel {
  String? status;
  String? msg;
  List<StateData>? data;

  StateModel({this.status, this.msg, this.data});

  StateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <StateData>[];
      json['data'].forEach((v) {
        data!.add(new StateData.fromJson(v));
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

class StateData {
  int? id;
  int? cID;
  String? state;

  StateData({this.id, this.cID, this.state});

  StateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cID = json['CID'];
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CID'] = this.cID;
    data['State'] = this.state;
    return data;
  }
}
