import 'package:flutter/material.dart';
import 'package:snsante/models/planning.dart';

import '../models/fonctionnality.dart';
import '../styles/colors.dart';

class CardPlanning extends StatelessWidget {
  final Planning planning;
  const CardPlanning(this.planning, 
  {super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                child: Text(planning.jour+" de "+planning.debut+" à "+planning.fin+"\n"+planning.nom,
                  style: TextStyle(fontSize: 18,
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
