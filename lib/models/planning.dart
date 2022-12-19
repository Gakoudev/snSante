// To parse this JSON data, do
//
//     final planning = planningFromJson(jsonString);

import 'dart:convert';

List<Planning> planningFromJson(String str) => List<Planning>.from(json.decode(str).map((x) => Planning.fromJson(x)));

String planningToJson(List<Planning> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Planning {
    Planning({
        required this.jour,
        required this.debut,
        required this.fin,
        required this.nom,
    });

    String jour;
    String debut;
    String fin;
    String nom;

    factory Planning.fromJson(Map<String, dynamic> json) => Planning(
        jour: json["jour"],
        debut: json["debut"],
        fin: json["fin"],
        nom: json["nom"],
    );

    Map<String, dynamic> toJson() => {
        "jour": jour,
        "debut": debut,
        "fin": fin,
        "nom": nom,
    };
}
