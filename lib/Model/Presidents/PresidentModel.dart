class PresidentDataModel {
  List<President>? president;
  PresidentDataModel({this.president});
  PresidentDataModel.fromJson(List<dynamic> json) {
    if (json != null) {
      president = <President>[];
      json.forEach((v) {
        president!.add(new President.fromJson(v));
      });
    }
  }

  get name => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.president != null) {
      data['*'] = this.president!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class President {
  int? id;
  int? ordinal;
  String? name;
  String? yearsInOffice;
  List<dynamic>? vicePresidents;
  String? photo;

  President({
    this.id,
    this.ordinal,
    this.name,
    this.yearsInOffice,
    this.vicePresidents,
    this.photo,
  });

  President.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ordinal = json['ordinal'];
    name = json['name'];
    yearsInOffice = json['yearsInOffice'];
    vicePresidents = json['vicePresidents'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ordinal'] = this.ordinal;
    data['name'] = this.name;
    data['yearsInOffice'] = this.yearsInOffice;
    data['vicePresidents'] = this.vicePresidents;
    data['photo'] = this.photo;
    return data;
  }
}