import 'package:flutter/material.dart';
import 'package:pulsar/model/clearance_model.dart';
import 'package:pulsar/services/api_service.dart';

class Clearance extends StatefulWidget {
  //
  Clearance() : super();

  @override
  _ClearanceState createState() => _ClearanceState();
}

class _ClearanceState extends State<Clearance> {
  //
  List<StudentClearance> _clearance;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    ClearanceServices.getClearance().then((clearance) {
      setState(() {
        _clearance = clearance;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Clearance'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _clearance ? 0 : _clearance.length,
          itemBuilder: (context, index) {
            StudentClearance user = _clearance[index];
            return ListTile(
              title: Text(user.violationDesc),
              subtitle: Text(user.status),
            );
          },
        ),
      ),
    );
  }
}
