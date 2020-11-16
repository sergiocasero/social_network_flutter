import 'package:social_network_flutter/domain/model/User.dart';

class UserResponse {
  User data;

  UserResponse({this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: json['data'] != null ? User.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
