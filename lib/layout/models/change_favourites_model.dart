
import 'dart:convert';

ChangeFavouritesModel changeFavouritesModelFromJson(String str) => ChangeFavouritesModel.fromJson(json.decode(str));

String changeFavouritesModelToJson(ChangeFavouritesModel data) => json.encode(data.toJson());

class ChangeFavouritesModel {
  ChangeFavouritesModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory ChangeFavouritesModel.fromJson(Map<String, dynamic> json) => ChangeFavouritesModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
