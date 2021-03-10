import 'package:flutter/material.dart';
import 'package:pulsar/profile/profile_menu.dart';
import 'package:pulsar/profile/profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Profile",
            icon: "assets/images/student_profile.png",
            press: () =>
                {Navigator.of(context).pushReplacementNamed('/profile')},
          ),
          ProfileMenu(
            text: "Grades",
            icon: "assets/images/grades.png",
            press: () =>
                {Navigator.of(context).pushReplacementNamed('/grades')},
          ),
          ProfileMenu(
            text: "Pre-registration",
            icon: "assets/images/pre_registration.png",
            press: () {
              Navigator.of(context).pushReplacementNamed('/preRegistration');
            },
          ),
          ProfileMenu(
            text: "Clearance",
            icon: "assets/images/clearance.png",
            press: () {
              Navigator.of(context).pushReplacementNamed('/clearance');
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon:
                "assets/images/logout.png", //Icon from https://www.flaticon.com/svg/vstatic/svg/483/483343.svg?token=exp=1614868580~hmac=f1b8e5c4037fa829f993d13427eedfb7
            press: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
