/// id : ""

class Data {
  String _id;

  String get id => _id;

  Data({
      String id}){
    _id = id;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    return map;
  }

}