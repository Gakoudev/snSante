// To parse this JSON data, do
//
//     final ambulance = ambulanceFromJson(jsonString);

import 'dart:convert';

List<Ambulance> ambulanceFromJson(String str) => List<Ambulance>.from(json.decode(str).map((x) => Ambulance.fromJson(x)));

String ambulanceToJson(List<Ambulance> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ambulance {
    Ambulance({
        required this.id,
        required this.description,
        required this.phone,
        required this.longitude,
        required this.latitude,
    });

    int id;
    String description;
    int phone;
    String longitude;
    String latitude;

    factory Ambulance.fromJson(Map<String, dynamic> json) => Ambulance(
        id: json["id"],
        description: json["description"],
        phone: json["phone"],
        longitude: json["longitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "phone": phone,
        "longitude": longitude,
        "latitude": latitude,
    };
}
