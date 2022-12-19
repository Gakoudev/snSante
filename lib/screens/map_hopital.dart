import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snsante/screens/services.dart';
import 'package:snsante/services/hopital_service.dart';
import '../styles/colors.dart';
import '../widgets/button_neumorphic.dart';
import '../widgets/heardersecond.dart';

class MapHopitalPage extends StatefulWidget{
  
  MapHopitalPage({super.key});

  
  @override
  _MapHopitalPageState createState() => _MapHopitalPageState();
}

class _MapHopitalPageState extends State<MapHopitalPage> {
  HoptalService mapController = Get.put(HoptalService());
  final Completer<GoogleMapController> _controller = Completer();
  double? lat;
  double? longe;
  var isLoaded = false;
  List<Marker> _markers =[];
  @override
  void initState() {
    super.initState();
    mapController.getStructure();
    loadData();
  }
  Future<Position> _getUserCurrentLocation() async {


    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();

  }

  
  loadData(){
    _getUserCurrentLocation().then((value) async {
      
      mapController.mapModel.forEach((element) {
         _markers.add( 
          Marker(
            markerId:  MarkerId(element.id.toString()),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  position: LatLng(double.parse(element.longitude) ,double.parse(element.latitude)),
                  infoWindow:  InfoWindow(
                      title: element.nom
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder){ 
                        return SizedBox(
                          height: 300,
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    element.nom,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(element.description),
                                  leading: Icon(
                                    Icons.local_hospital,
                                    color: Colors.blue[500],
                                  ),
                                ),
                                const Divider(),
                                ListTile(
                                  title: Text(
                                    '(+221)'+element.phone.toString(),
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  leading: Icon(
                                    Icons.phone_callback_rounded,
                                    color: Colors.blue[500],
                                  ),
                                  onTap: () async{
                                    FlutterPhoneDirectCaller.callNumber(element.phone.toString());
                                  } ,
                                ),
                                ListTile(
                                  title: const Text('Itinéraire'),
                                  leading: Icon(
                                    Icons.directions_walk_rounded,
                                    color: Colors.blue[500],
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Services'),
                                  leading: Icon(
                                    Icons.local_hospital_sharp,
                                    color: Colors.blue[500],
                                    
                                  ),
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ServicesPage(element.id),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                  },
              
          )
        );
      });
      setState(() {
        isLoaded = true;
        lat = value.latitude;
        longe = value.longitude;
      });
        _markers.add( Marker(
              markerId: const MarkerId('myposition'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              position: LatLng(value.latitude ,value.longitude),
              infoWindow:  InfoWindow(
                  title: "ma position"
              )
          
      ));

      final GoogleMapController controller = await _controller.future;
      CameraPosition _kGooglePlex =  CameraPosition(
        target: LatLng(value.latitude ,value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
      setState(() {

      });
    });
  }
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
        'Hôpitaux',
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
          _buildMap(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Expanded(
      child: Center(
          child: Obx(
              () => mapController.mapModel.isNotEmpty
                  ? GoogleMap(
                mapType: MapType.terrain,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(mapController.mapModel.last.longitude),
                  double.parse(mapController.mapModel.last.latitude)),
                  zoom: 13,
                ),
                markers: Set<Marker>.of( _markers),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      )),
    );
  }

} 

