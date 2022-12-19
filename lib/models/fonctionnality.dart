import 'package:flutter/material.dart';

class Functionnality {
  final String title, image;

  Functionnality(
      {required this.title,
      required this.image,})
      : assert(title != null),
        assert(image != null);
}

List<Functionnality> listFunction = [
  Functionnality(
    title: "Hôpitaux",
    image: "assets/logo_hopital.jpg",
  ),Functionnality(
    title: "Pharmacies",
    image: "assets/logo_pharmacie.jpg",
  ),Functionnality(
    title: "Ambulances",
    image: "assets/logo_ambulance.jpg",
  ),Functionnality(
    title: "Planning Médecin",
    image: "assets/logo_planning.jpg",
  ),
];
List<Functionnality> listSpecialisation = [
  Functionnality(
    title: "Cardiologue",
    image: "assets/cardio.jpg",
  ),Functionnality(
    title: "Pneumologue",
    image: "assets/pneu.jpg",
  ),Functionnality(
    title: "Neurologue",
    image: "assets/neuro.jpg",
  ),Functionnality(
    title: "Cancerologue",
    image: "assets/cancer.jpg",
  ),
];