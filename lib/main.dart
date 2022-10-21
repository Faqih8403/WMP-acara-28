import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  print(username);
  runApp(MaterialApp(home: username == null ? mainForm() : masukApp()));
}

class mainForm extends StatefulWidget {
  @override
  _mainForm createState() => _mainForm();
}

class _mainForm extends State<mainForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> setSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", usernameController.text);
    await prefs.setString("password", passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Menu"),
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                controller: usernameController,
                decoration: new InputDecoration(
                    hintText: "Nama Pengguna",
                    icon: Icon(Icons.account_circle)),
              ),
              SizedBox(height: 15),
              TextFormField(
                autofocus: true,
                controller: passwordController,
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: "Masukan Password",
                    icon: Icon(Icons.key_outlined)),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: MaterialButton(
                    child: Text("Login"),
                    minWidth: double.infinity,
                    height: 45.0,
                    color: Colors.blueAccent,
                    textColor: Colors.white70,
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      if (username == "faqih" && password == "123") {
                        setSharedPreferences();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => masukApp()));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Informasi!"),
                              content: Text(
                                  "Gagal Masuk Silahkan Periksa Kembali Username dan Password anda!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Okay"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: const Text("Daftar!"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
