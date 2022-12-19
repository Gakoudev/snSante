import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snsante/models/medecin.dart';
import 'package:snsante/screens/planning.dart';
import 'package:snsante/services/base_client.dart';
import '../styles/colors.dart';
import '../widgets/button_neumorphic.dart';
import 'package:http/http.dart' as http;
import '../widgets/card_medecin.dart';
import '../widgets/heardersecond.dart';

class MedecinPage extends StatefulWidget{
  int id;
  MedecinPage(this.id,{super.key});

  
  @override
  _MedecinPageState createState() => _MedecinPageState();
}

class _MedecinPageState extends State<MedecinPage> {
  List<Medecin>? medecins;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData() async{
      this.medecins = await BaseClient().getMedecin('/medecin/'+widget.id.toString());
      if (this.medecins != null) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  /*
  void getData() async{
    String url = 'http://10.0.2.2:8000/api/medecin/'+widget.id.toString() ;
    Response response = await get(Uri.parse(url));
    this.medecins = medecinFromJson(response.body);
    if (this.medecins != null) {
      setState(() {
        isLoaded = true;
      });
    }
  
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.light,
      body: _buildBody(),
    );
  }
 Widget _buildAppBar() {
    return HeaderSecond(
      appname: const Text(
        'Médecins',
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
          _buildMedecin(),
        ],
      ),
    );
  }

Widget _buildMedecin() {
    return Expanded(
      child: Center(
        child: ListView.builder(
          itemCount: medecins?.length ?? 0,
          itemBuilder: (context, index) {
            Medecin medecin = medecins![index];
            return CardMedecin(
              medecin,
              //medecins![index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanningPage(medecin.id),
                    ),
                  ),
                );  
          }      
        ),
      ),
    );
  }
 

} 

