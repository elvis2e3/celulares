import 'dart:convert';

import 'package:celulares/globals.dart';
import 'package:celulares/model/celular_model.dart';
import 'package:http/http.dart' as http;

class CelularProvider{


  Future<List<Celular>> getCelulares() async {
//    String url = "https://celulares-backend.herokuapp.com/api/celulares";
    String url = Uri.https(HOST, URL_CELULAR).toString();
    var respuesta = await http.get(url);
    if(respuesta.statusCode == 200){
      String datos = respuesta.body;
      var jsonDatos = json.decode(datos);
      Celulares celulares = new Celulares.fromJson(jsonDatos);
      return celulares.celulares;
    }
    return [];
  }

  Future<bool> deleteCelulares(Celular celular) async {
//    String url = "https://celulares-backend.herokuapp.com/api/celulares/10";
    String url = Uri.https(HOST, "${URL_CELULAR}${celular.id}").toString();
    var respuesta = await http.delete(url);
    if(respuesta.statusCode == 204){
      return true;
    }
    return false;
  }

  Future<bool> postCelulares(Celular celular) async {
//    String url = "https://celulares-backend.herokuapp.com/api/celulares/10";
    String url = Uri.https(HOST, URL_CELULAR).toString();
    var respuesta = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "modelo": celular.modelo,
        "marca": celular.marca
      })
    );
    if(respuesta.statusCode == 201){
      return true;
    }
    return false;
  }

}