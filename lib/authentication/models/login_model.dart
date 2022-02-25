import 'dart:convert';

ShopLoginModel shopLoginModelFromJson(String str) => ShopLoginModel.fromJson(json.decode(str));

String shopLoginModelToJson(ShopLoginModel data) => json.encode(data.toJson());

class ShopLoginModel {
  ShopLoginModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  UserData data;

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) => ShopLoginModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ?UserData.fromJson(json["data"]) :null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };
}
