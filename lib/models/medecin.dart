// To parse this JSON data, do
//
//     final medecin = medecinFromJson(jsonString);

import 'dart:convert';

import 'package:snsante/services/base_client.dart';

List<Medecin> medecinFromJson(String str) => List<Medecin>.from(json.decode(str).map((x) => Medecin.fromJson(x)));

String medecinToJson(List<Medecin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medecin {
    Medecin({
        required this.id,
        required this.numCarte,
        required this.prenom,
        required this.nom,
        required this.login,
        required this.password,
        required this.phone,
        required this.status,
        required this.speciality,
        required this.administrateurId,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String numCarte;
    String prenom;
    String nom;
    String login;
    String password;
    int phone;
    int status;
    int speciality;
    int administrateurId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Medecin.fromJson(Map<String, dynamic> json) => Medecin(
        id: json["id"],
        numCarte: json["num_carte"],
        prenom: json["prenom"],
        nom: json["nom"],
        login: json["login"],
        password: json["password"],
        phone: json["phone"],
        status: json["status"],
        speciality: json["speciality"],
        administrateurId: json["administrateur_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num_carte": numCarte,
        "prenom": prenom,
        "nom": nom,
        "login": login,
        "password": password,
        "phone": phone,
        "status": status,
        "speciality": speciality,
        "administrateur_id": administrateurId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
