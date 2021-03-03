import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulsar/services/shared_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulsar'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Color(0xffffffff),
            ),
            onPressed: () {
              SharedService.logout(context);
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Color(0xff35438c),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
