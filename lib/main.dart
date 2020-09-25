
import 'package:celulares/page/form_celular_page.dart';
import 'package:celulares/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "home",
      routes: <String, Widget Function(BuildContext)>{
        "home": (context) => HomePage(),
        "form_celular": (context) => FormCelularPage()
      },
    );
  }
}

