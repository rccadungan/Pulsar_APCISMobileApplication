import 'package:flutter/material.dart';
import 'package:pulsar/profile/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color(0xff35438c),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          color: Color(0xff35438c),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/myAppPage');
          },
        ),
      ),
      body: Body(),
    );
  }
}
