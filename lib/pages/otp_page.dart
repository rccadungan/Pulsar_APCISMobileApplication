import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Verification',
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
            Navigator.of(context).pushReplacementNamed('/assessment');
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PinEntryTextField(
              showFieldAsBox: true,
              onSubmit: (String pin) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Pin"),
                      content: Text('Pin entered is $pin'),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
