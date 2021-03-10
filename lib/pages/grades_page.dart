import 'package:flutter/material.dart';

class GradesPage extends StatefulWidget {
  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grades',
          style: TextStyle(
            color: Color(0xff35438c),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF0F0F0),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          color: Color(0xff35438c),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/profileScreen');
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  buildClassItem(),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildClassItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "MCSPROJ",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Applied Project 2",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
