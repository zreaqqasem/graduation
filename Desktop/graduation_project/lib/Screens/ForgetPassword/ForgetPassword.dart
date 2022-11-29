import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/Screens/CheckPin/CheckPin.dart';
import 'package:untitled/Screens/Login/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgetPassword(),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102, 17, 17, 1),
          title: Center(
            child: Text('Linka'),
          ),
        ),
        backgroundColor: Color.fromRGBO(102, 17, 17, 1),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
            child: Container(
                //height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(),
                child: Image(
                  image: AssetImage('images/Logo1.png'),
                )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Colors.white,
              // gradient: LinearGradient(colors: [
              //   Color.fromRGBO(0x8f, 0x8e, 0x8e, 0),
              //     Color.fromRGBO(0x8f, 0x8e, 0x8e, 1)
              //   ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontFamily: 'DG-Sahabah',
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Enter email address",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 30),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      labelText: 'Enter your email',
                    ),
                  ),
                ),
                Container(
                    height: 30,
                    width: 160,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(107, 17, 17, 1),
                      ),
                      child: const Text('Send'),
                      onPressed: () {
                        print(emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckPin()));
                      },
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginDemo()));
                    },
                    child: const Text(
                      'Back to sign in',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
