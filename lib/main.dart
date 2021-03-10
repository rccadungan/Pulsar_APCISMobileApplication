import 'package:flutter/material.dart';
import 'package:pulsar/pages/assessment_page.dart';
import 'package:pulsar/pages/clearance_page.dart';
import 'package:pulsar/pages/grades_page.dart';
import 'package:pulsar/pages/home_page.dart';
import 'package:pulsar/pages/login_page.dart';
import 'package:pulsar/pages/notification_page.dart';
import 'package:pulsar/pages/otp_page.dart';
import 'package:pulsar/pages/pre_registration_page.dart';
import 'package:pulsar/pages/profile_page.dart';
import 'package:pulsar/pages/schedule_page.dart';
import 'package:pulsar/profile/profile_screen.dart';
import 'package:pulsar/services/shared_service.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

Widget defaultHome = new LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool result = await SharedService.isLoggedIn();

  if (result) {
    defaultHome = new HomePage();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff35438c),
          accentColor: Color(0xffdeac4b)),
      home: defaultHome,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/myAppPage': (BuildContext context) => new MyAppPage(),
        '/profile': (BuildContext context) => new ProfilePage(),
        '/grades': (BuildContext context) => new GradesPage(),
        '/preRegistration': (BuildContext context) => new PreRegistrationPage(),
        '/clearance': (BuildContext context) => new ClearancePage(),
        '/profileScreen': (BuildContext context) => new ProfileScreen(),
        '/assessment': (BuildContext context) => new AssessmentPage(),
        '/otp': (BuildContext context) => new OtpScreen()
      },
    );
  }
}

//Bottom Nav Bar
class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  //Initialize the variable _currentIndex for selectedIndex parameter.
  int _currentIndex = 0;
  final List pages = [
    HomePage(),
    SchedulePage(),
    AssessmentPage(),
    NotificationPage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Color(0xFFF0F0F0),
          selectedIndex: _currentIndex,
          onItemSelected: (int index) {
            setState(() => _currentIndex = index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: Text('Home'),
              icon: Image.asset(
                "assets/images/home.png",
                width: 27.0,
                height: 27.0,
              ),
              inactiveColor: Colors.grey,
              activeColor: Color(0xff35438c),
            ),
            BottomNavyBarItem(
              title: Text('Schedule'),
              icon: Image.asset(
                "assets/images/schedule.png",
                width: 27.0,
                height: 27.0,
              ),
              inactiveColor: Colors.grey,
              activeColor: Color(0xff35438c),
            ),
            BottomNavyBarItem(
              title: Text('Assessment'),
              icon: Image.asset(
                "assets/images/assessment.png",
                width: 27.0,
                height: 27.0,
              ),
              inactiveColor: Colors.grey,
              activeColor: Color(0xff35438c),
            ),
            BottomNavyBarItem(
              title: Text('Notifications'),
              icon: Image.asset(
                "assets/images/notification.png",
                width: 27.0,
                height: 27.0,
              ),
              inactiveColor: Colors.grey,
              activeColor: Color(0xff35438c),
            ),
            BottomNavyBarItem(
              title: Text('More'),
              icon: Icon(Icons.more_horiz),
              inactiveColor: Colors.grey,
              activeColor: Color(0xff35438c),
            ),
          ],
        ),
        body: pages[_currentIndex]);
  }
}
