// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
    Service({
        required this.nom,
        required this.description,
    });

    String nom;
    String description;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        nom: json["nom"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "nom": nom,
        "description": description,
    };
}
