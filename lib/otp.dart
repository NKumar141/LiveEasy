import 'package:flutter/material.dart';
import 'package:myapp/phone.dart';
import 'package:myapp/profile.dart';
import '../src/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main2.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class app4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: Lang3(),
    );
  }
}

class Lang3 extends StatefulWidget {
  _Lang3State createState() => _Lang3State();
}

class _Lang3State extends State<Lang3> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                  'assets/images/Untitled2.png',
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
            top: 0.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(7, 7, 0, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => app3()));
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 10, 0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Verify Phone",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  height: 42,
                  width: 185,
                  alignment: Alignment.center,
                  child: Text(
                    "Code is sent to 8094508485",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                fillColor: Color(0xFF93D2F3),

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                    height: 42,
                    width: 250,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Didn’t receive the code?',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Request Again',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 48,
                width: 320,
                child: ElevatedButton(
                    child: Text("VERIFY AND CONTINUE",
                        style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff465998)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side:
                                        BorderSide(color: Color(0xff465998))))),
                    onPressed: () => {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => app5()))
                        }),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
