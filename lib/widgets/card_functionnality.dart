import 'package:flutter/material.dart';

import '../models/fonctionnality.dart';
import '../styles/colors.dart';

class CardFunction extends StatelessWidget {
  final Functionnality functionnality;
  final VoidCallback onTap;
  const CardFunction(this.functionnality, {super.key, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: ThemeColor.light,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Image.asset(functionnality.image),
                ),
              ),
              SizedBox(height: 5),
              Text(
                functionnality.title,
                style: TextStyle(
                  color: ThemeColor.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
