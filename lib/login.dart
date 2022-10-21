import 'package:flutter/material.dart';
import 'package:login/drawer.dart';

class masukApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Beranda")),
        drawer: DrawerScreen(),
        body: Container(
          padding: EdgeInsets.only(
              top: 800.0, bottom: 50.0, right: 50.0, left: 270.0),
          child: MaterialButton(
              minWidth: 100,
              height: 50.0,
              color: Colors.blueAccent,
              textColor: Colors.white70,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali")),
        ));
  }
}
