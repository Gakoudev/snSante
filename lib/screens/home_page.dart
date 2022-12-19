import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snsante/screens/map_ambulance.dart';
import 'package:snsante/screens/map_hopital.dart';
import 'package:snsante/screens/map_pharmacie.dart';
import 'package:snsante/screens/specialiste.dart';

import '../models/fonctionnality.dart';
import '../styles/colors.dart';
import '../widgets/card_functionnality.dart';
import '../widgets/hearder.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.light,
      body: _buildBody(),
      //bottomNavigationBar: _buildBottomNavBar(),
    );
  }
  @override
  void initState() {
    super.initState();
  }
  Widget _buildAppBar() {
    return Header(
      appname: const Text(
        'Sn Santé',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 22),
      ),
      bgColor: ThemeColor.darkBlue,
      logo: const Image(
        image: AssetImage("assets/icon_app.jpg"),
        width: 120.0,
      ),
      
    );
  }
  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          _buildGridFunction(),
        ],
      ),
    );
  }

   Widget _buildGridFunction() {
    return Expanded(
      child: Center(
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: .6),
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return CardFunction(
                  listFunction[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapHopitalPage(),
                    ),
                  ),
                );
                break;
              case 1: 
                return CardFunction(
                  listFunction[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPharmaciePage(),
                    ),
                  ),
                );
                break;
              case 2: 
                return CardFunction(
                  listFunction[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapAmbulancePage(),
                    ),
                  ),
                );
                break;
              default: 
                return CardFunction(
                  listFunction[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecialistePage(listFunction[index]),
                    ),
                  ),
                );
                break;
            }
            //case index:
          },
        ),
      ),
    );
  }
 

} 