import 'data.dart';

/// data : [{"id":""}]

class MediaResponseDto {
  List<Data> _data;

  List<Data> get data => _data;

  MediaResponseDto({
      List<Data> data}){
    _data = data;
}

  MediaResponseDto.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}