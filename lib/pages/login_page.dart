import 'package:flutter/material.dart';
import 'package:pulsar/services/ProgressHUD.dart';
import 'package:pulsar/services/api_service.dart';
import 'package:pulsar/utils/form_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  bool hidePassword = true;
  bool isAPICallProcess = false;

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        body: ProgressHUD(
          child: _loginUISetup(context),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _loginUISetup(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        child: new Form(
          key: globalFormKey,
          child: _loginUI(context),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/pulsar_logo_icon.png',
                    fit: BoxFit.contain, width: 180),
              ),
              Spacer()
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 50),
          child: FormHelper.inputFieldWidget(
            context,
            Icon(Icons.person_rounded),
            "username",
            "Username",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username cannot be empty";
              }
              return null;
            },
            (onSavedValue) {
              username = onSavedValue.toString().trim();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FormHelper.inputFieldWidget(
              context, Icon(Icons.lock), "password", "Password",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Password cannot be empty";
            }
            return null;
          }, (onSavedValue) {
            password = onSavedValue.toString().trim();
          },
              initialValue: "",
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Color(0xff35438c).withOpacity(0.4),
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 350,
          height: 50,
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/myAppPage');
              },
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 20),
              ),
              color: Color(0xff35438c),
              textColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        // new Center(
        //   child: FormHelper.saveButton(
        //     "Log In",
        //     () {
        //       if (validateAndSave()) {
        //         print("Username : $username");
        //         print("Password : $password");

        //         setState(() {
        //           this.isAPICallProcess = true;
        //         });

        //         APIServices.loginCustomer(username, password).then((response) {
        //           setState(() {
        //             this.isAPICallProcess = false;
        //           });
        //           if (response) {
        //             globalFormKey.currentState.reset();
        //             Navigator.of(context).pushReplacementNamed('/home');
        //           } else {
        //             FormHelper.showMessage(
        //                 context,
        //                 'Log In',
        //                 'Invalid Username or Password. \nUse your APC acount credentials.',
        //                 'Ok', () {
        //               Navigator.of(context).pop();
        //             });
        //           }
        //         });
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
