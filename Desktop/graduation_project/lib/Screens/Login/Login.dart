import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/Detailed/description.dart';
import 'package:untitled/Screens/ForgetPassword/ForgetPassword.dart';
import 'package:untitled/Screens/Home/Company/Company.dart';
import 'package:untitled/Screens/Home/Freelancer/Freelancer.dart';
import 'package:untitled/Screens/Home/Guest/Guest.dart';
import 'package:untitled/Screens/SignUp/SiguUp.dart';
import 'package:untitled/user.dart';

import '../../Services/firebase_auth_service.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    HostFireBaseAuth firebase = HostFireBaseAuth();

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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'DG-Sahabah',
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: const Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 25.0),
                  child: const Text(
                    "Email",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        // height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 25.0),
                  child: const Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 1, 20, 5),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        // height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                      ),
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
                      child: const Text('Login'),
                      onPressed: () async {
                        firebase.signInWithEmail(
                            nameController.text, passwordController.text);
                        await firebase
                            .saveLoginInformation(nameController.text);

                        firebase
                            .checkUserType(nameController.text)
                            .then((value) => {
                                  if (value == 0) //freelancer
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Freelancer()))
                                    }
                                  else if (value == 1) //guest
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Guest()))
                                    }
                                  else if (value == 2) //company
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Company()))
                                    }
                                });

                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => LoginDemo()));
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Create a new account',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ])),
      ),
    );
  }
}
