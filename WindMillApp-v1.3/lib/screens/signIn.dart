import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import 'howCanWeHelpYou.dart';
// import '../helpers/colorGradient.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool empty = true;
  int userLen = 0, passLen = 0;
  loginArrowColorChanger() {
    if (this.userLen != 0 && this.passLen != 0) {
      setState(() {
        this.empty = false;
      });
    } else {
      setState(() {
        this.empty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        // Backgeound Design
        CustomPaint(
          painter: CurvePainter(),
          size: Size.infinite,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // Main Screen Layout
          body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: height / 7),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    // LOGIN ICONBUTTON
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 70.0,
                        color: empty ? Colors.white : Colors.cyan,
                      ),
                      // TODO: Navigate to date and month specific
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HowCanWeHelpYou(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.cyan[200],
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty == true) {
                          return "Enter Username";
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          this.userLen = val.length;
                          loginArrowColorChanger();
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan[200],
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "USERNAME",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: "Enter your username",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty == true) {
                          return "Enter password";
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          this.passLen = val.length;
                          loginArrowColorChanger();
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan[200],
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: "Enter password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 23.0,
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                    // child: Text(
                    //   "There is Weather and there is buisness Weather",
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //     foreground: Paint()..shader = linearGradient,
                    //   ),
                    //   textScaleFactor: 1.5,
                    // ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 50.0),
                    child: Text(
                      "WANT TO JOIN?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      color: Colors.cyan[200],
                      //TODO: ONPRESSED MOVE TO NEXT PAGE
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                      child: Text(
                        "CLICK HERE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
