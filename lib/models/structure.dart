// To parse this JSON data, do
//
//     final structure = structureFromJson(jsonString);

import 'dart:convert';

List<Structure> structureFromJson(String str) => List<Structure>.from(json.decode(str).map((x) => Structure.fromJson(x)));

String structureToJson(List<Structure> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Structure {
    Structure({
        required this.id,
        required this.nom,
        required this.description,
        required this.phone,
        required this.longitude,
        required this.latitude,
    });

    int id;
    String nom;
    String description;
    int phone;
    String longitude;
    String latitude;

    factory Structure.fromJson(Map<String, dynamic> json) => Structure(
        id: json["id"],
        nom: json["nom"],
        description: json["description"],
        phone: json["phone"],
        longitude: json["longitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "description": description,
        "phone": phone,
        "longitude": longitude,
        "latitude": latitude,
    };
}
