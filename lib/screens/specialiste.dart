

import 'package:flutter/material.dart';
import 'package:snsante/widgets/button_neumorphic.dart';
import 'package:snsante/widgets/card_specialisation.dart';
import 'package:snsante/widgets/heardersecond.dart';

import '../models/fonctionnality.dart';
import '../styles/colors.dart';
import 'listmedecin.dart';


class SpecialistePage extends StatelessWidget {
  final Functionnality functionnality;
  late BuildContext context;
  SpecialistePage(this.functionnality);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: ThemeColor.light,
      body: _buildBody(),
    );

    
  }

  Widget _buildAppBar() {
    return HeaderSecond(
      appname: const Text(
        'Spécialité',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 22),
      ),
      bgColor: ThemeColor.darkBlue,
      logo: const Image(
        image: AssetImage("assets/icon_app.jpg"),
        width: 120.0,
      ),
      leadingBtn: ButtonNeumorphic(
        onTap: () => Navigator.pop(context),
        bgColor: ThemeColor.light,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        topShadowColor: Colors.grey.withOpacity(0.1),
        bottomShadowColor: Colors.black.withOpacity(0.5),
    )
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          _buildSpeciality(),
        ],
      ),
    );
  }

  Widget _buildSpeciality() {
    return Expanded(
      
      child: Container(
        
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: .6),
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return CardSpecialisation(
              listSpecialisation[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedecinPage(index+1),
                ),
              ),
            );
               
            //case index:
          },
        ),
      ),
    );
  }


  
}
