// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());


class Driver {

    String? id;
    String? username;
    String? email;
    String? plate;

  
    Driver({
        this.id,
        this.username,
        this.email,
        this.plate,
    });



    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        plate: json["plate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "plate": plate,
    };
}
