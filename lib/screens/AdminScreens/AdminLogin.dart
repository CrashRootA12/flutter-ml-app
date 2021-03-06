import 'package:flutter/material.dart';

import 'AdminNavbar.dart';

class LogInAdminScreen extends StatefulWidget {
  @override
  _LogInAdminScreenState createState() => _LogInAdminScreenState();
}

class _LogInAdminScreenState extends State<LogInAdminScreen> {
  String tfEntryMail;
  String tfEntryPassword;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                onChanged: (value) => tfEntryMail = value,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.grey,
            child: TextField(
              onChanged: (value) => tfEntryPassword = value,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _loginStudentBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (tfEntryMail == "admin@mmumullana.org" &&
              tfEntryPassword == "admin123")
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationAdmin()),
            );
          else {
            // User Not Found
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("User Not Found"),
            ));
          }
        },
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.black,
        child: Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Schyler',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/admin.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text(
                    'Sign In as Administrator',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildEmailTF(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildPasswordTF(),
                  SizedBox(
                    height: 20,
                  ),
                  _loginStudentBtn(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        "New User? Sign Up Here",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
