
import 'package:celulares/model/celular_model.dart';
import 'package:celulares/provider/celular_provider.dart';
import 'package:flutter/material.dart';

class FormCelularPage extends StatefulWidget {
  @override
  _FormCelularPageState createState() => _FormCelularPageState();
}

class _FormCelularPageState extends State<FormCelularPage> {

  String _marca = "";
  String _modelo = "";
  bool es_crear_celular;
  CelularProvider _celularProvider = new CelularProvider();

  @override
  Widget build(BuildContext context) {

    es_crear_celular = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Celular"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Marca:",
              ),
              onChanged: (value){
                _marca = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Modelo:",
              ),
              onChanged: (value){
                _modelo = value;
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Guardar"),
              onPressed: (){
                  print(_marca);
                  print(_modelo);
                  Celular celular = new Celular(marca: _marca, modelo: _modelo);
                  _celularProvider.postCelulares(celular).then((value){
                    if(value){
                      Navigator.pop(context);
                    }
                  });
              },
            )
          ],
        ),
      ),
    );
  }
}
