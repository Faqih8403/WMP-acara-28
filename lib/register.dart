import 'package:flutter/material.dart';
import 'package:login/main.dart';

class Register extends StatelessWidget{
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(23.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: 40.0, left: 10.0, bottom: 10.0, right: 10.0),
                alignment: Alignment.center,
                child: Image.asset("assets/logo-polije.png"),
              ),
              SizedBox(height: 15),
              TextFormField(
                autofocus: true,
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: "Masukan Email",
                    icon: Icon(Icons.email_outlined)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                decoration: new InputDecoration(
                    hintText: "Nama Pengguna",
                    icon: Icon(Icons.account_circle)),
              ),
              SizedBox(height: 15),
              TextFormField(
                autofocus: true,
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: "Masukan Password",
                    icon: Icon(Icons.key_outlined)),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: MaterialButton(
                    child: Text("Daftar"),
                    minWidth: double.infinity,
                    height: 45.0,
                    color: Colors.blueAccent,
                    textColor: Colors.white70,
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainForm()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}