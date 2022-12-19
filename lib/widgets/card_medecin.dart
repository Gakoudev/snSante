import 'package:flutter/material.dart';
import 'package:snsante/models/medecin.dart';

import '../models/fonctionnality.dart';
import '../styles/colors.dart';

class CardMedecin extends StatelessWidget {
  final Medecin medecin;
  final VoidCallback onTap;
  const CardMedecin(this.medecin, 
  {super.key, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Material(
        color: ThemeColor.light,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Container>[
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headline4!.fontSize! * 1.5 + 50.0,
                ),
                padding: const EdgeInsets.all(6.0),
                color: Colors.blue[600],
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0.1),
                // child: Text("Docteur ",
                child: Text("Docteur "+medecin.prenom+" "+medecin.nom+"\n"+medecin.phone.toString(),
                  style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold)
                  ,
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
