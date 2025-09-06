
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? uid;
    String? firstName;
    String? lastName;
    String? email;
    String? address;
    String? createAt;

    UserModel({
        this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.createAt,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address: json["address"],
        createAt: json["createAt"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "createAt": createAt,
    };
}
