import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ForgetPassword/ForgetPassword.dart';
import 'package:untitled/Screens/SignUp/SiguUp.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                      fontSize: 40,
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
                  padding: const EdgeInsets.only(left: 20.0),
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
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
                  child: TextField(
                    controller: nameController,
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
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
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
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
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
                      labelText: 'Enter your password',
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
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
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
            ),
          ),
        ])),
      ),
    );
  }
}
