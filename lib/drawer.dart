import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/call.dart';
import 'package:login/group.dart';
import 'package:login/kontak.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Faqih Mustafa"),
          currentAccountPicture:
          CircleAvatar(backgroundImage: AssetImage("assets/faqih.jpg")),
          accountEmail: Text("faqih4199@gmail.com"),
        ),
        DrawerListTile(
          iconData: Icons.group_add_outlined,
          title: "NewGroup",
          onTilePressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Group()));
          },
        ),
        DrawerListTile(
          iconData: Icons.quick_contacts_dialer_outlined,
          title: "Contacts",
          onTilePressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Kontak()));
          },
        ),
        DrawerListTile(
          iconData: Icons.phone_enabled_outlined,
          title: "Calls",
          onTilePressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Call()));
          },
        ),
        DrawerListTile(
          iconData: Icons.logout_rounded,
          title: "Logout",
          onTilePressed: () async { 
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('username');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => mainForm()));
          },
        ) //DrawerListTile
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {required this.iconData,
      required this.title,
      required this.onTilePressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
