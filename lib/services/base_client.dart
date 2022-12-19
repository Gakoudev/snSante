import 'dart:convert';
import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snsante/models/medecin.dart';
import 'package:snsante/models/planning.dart';
import 'package:snsante/models/service.dart';
import 'package:snsante/models/structure.dart';

const String baseUrl = 'http://10.0.2.2:8000/api';

class BaseClient {
  List<Structure> mapModel = <Structure>[].obs;
  var isLoading = false.obs;
  var client = http.Client();

  //GET Medecin
  Future<List<Medecin>> getMedecin(String api) async {
    Response response = await get(Uri.parse(baseUrl + api));
    if (response.statusCode == 200) {
      return medecinFromJson(response.body);
    }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Medecin');
    }
  }
  
  //GET Medecin
  Future<List<Planning>> getPlanning(String api) async {
    Response response = await get(Uri.parse(baseUrl + api));
    if (response.statusCode == 200) {
      return planningFromJson(response.body);
    }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Medecin');
    }
  }
  //GET Medecin
  Future<List<Service>> getService(String api) async {
    Response response = await get(Uri.parse(baseUrl + api));
    if (response.statusCode == 200) {
      return serviceFromJson(response.body);
    }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Medecin');
    }
  }
  //GET Hopital OR PHARMACIE
  void getStructure() async {
   
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse('http://10.0.2.2:8000/api/medecin')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        log(result.toString());
        mapModel.addAll(RxList<Map<String, dynamic>>.from(result)
            .map((e) => Structure.fromJson(e))
            .toList());
      } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load Medecin');
      }
    
  }
  

  
}