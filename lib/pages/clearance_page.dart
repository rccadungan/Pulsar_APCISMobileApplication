// import 'package:flutter/material.dart';
// import 'package:pulsar/model/clearance_model.dart';
// import 'package:pulsar/services/api_service.dart';

// class Clearance extends StatefulWidget {
//   Clearance() : super();

//   @override
//   _ClearanceState createState() => _ClearanceState();
// }

// class _ClearanceState extends State<Clearance> {
//   List<StudentClearance> _clearance;
//   bool _loading;

//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     ClearanceServices.getClearance().then((clearance) {
//       setState(() {
//         _clearance = clearance;
//         _loading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_loading ? 'Loading...' : 'Clearance'),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: ListView.builder(
//           itemCount: null == _clearance ? 0 : _clearance.length,
//           itemBuilder: (context, index) {
//             StudentClearance user = _clearance[index];
//             return ListTile(
//               title: Text(user.violationDesc),
//               subtitle: Text(user.status),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

///UI
import 'package:flutter/material.dart';

class ClearancePage extends StatefulWidget {
  @override
  _ClearancePageState createState() => _ClearancePageState();
}

class _ClearancePageState extends State<ClearancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clearance',
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
            Navigator.of(context).pushReplacementNamed('/myAppPage');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "AM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "Violation: Dress Code",
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
                      "Tap to see more details",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
