import 'package:flutter/material.dart';
import '../screens/splashScreen.dart';

class FormSubmittedScreen extends StatefulWidget {
  @override
  _FormSubmittedScreenState createState() => _FormSubmittedScreenState();
}

class _FormSubmittedScreenState extends State<FormSubmittedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud_done,
              color: Colors.green,
              size: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "We will get in touch with you as soon as possible",
                style: TextStyle(
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
