import 'package:flutter/material.dart';
import 'package:snsante/models/planning.dart';
import 'package:snsante/models/service.dart';

import '../styles/colors.dart';

class CardService extends StatelessWidget {
  final Service service;
  const CardService(this.service, 
  {super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        color: ThemeColor.light,
        child: Padding(
          padding: EdgeInsets.all(6),
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
                child: Text(service.nom+"\n"+service.description,
                  style: TextStyle(fontSize: 16,
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
