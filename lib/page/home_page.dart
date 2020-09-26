
import 'package:celulares/model/celular_model.dart';
import 'package:celulares/provider/celular_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CelularProvider _celularProvider = new CelularProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Celulares"),
        actions: [
          IconButton(
            icon: Icon(Icons.update),
            onPressed: (){
              setState(() {
                
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _celularProvider.getCelulares(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<Celular> celulares = snapshot.data;
            return ListView(
              children: celulares.map(
                  (celular) => ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text(celular.modelo),
                    subtitle: Text(celular.modelo),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        _celularProvider.deleteCelulares(celular).then((value){
                          if(value){
                            setState(() {

                            });
                          }
                        });
                      },
                    ),
                  )
              ).toList()..add(ListTile())..add(ListTile())
            );
          }else{
            return Center(
              child: Text("cargando..."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, "form_celular", arguments: true);
        },
      ),
    );
  }
}
