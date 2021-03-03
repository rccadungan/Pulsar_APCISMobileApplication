import 'package:flutter/material.dart';
import 'package:pulsar/pages/home_page.dart';
import 'package:pulsar/pages/login_page.dart';
import 'package:pulsar/services/shared_service.dart';

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
        '/login': (BuildContext context) => new LoginPage()
      },
    );
  }
}
