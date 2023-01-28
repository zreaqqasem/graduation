import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Screens/ForgetPassword/ForgetPassword.dart';
import 'package:untitled/Screens/Login/Login.dart';
import 'package:intl/intl.dart';

import '../../Services/firebase_auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  bool _isObscure1 = true;
  // bool freelancer = false;
  Map<String, bool> values = {
    'Freelancer': false,
    'Guest': false,
    'Company': false,
  };
  HostFireBaseAuth firebase = HostFireBaseAuth();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int _value = 1;
  @override
  Widget build(BuildContext context) {
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
            child: ListView(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: new SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: const Text(
                      'Create new account',
                      style: TextStyle(
                        fontFamily: 'DG-Sahabah',
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text('Is it already Registered?'),
                  TextButton(
                      child: const Text(
                        'login here',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginDemo()));
                      }),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Name",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          // height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
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
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          // height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Date of birth",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                      ),
                    ),
                  ),
                  Container(
                      height: 60,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        controller:
                            dateController, //editing controller of this TextField
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          filled: true,
                          fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          //icon of text field
                          hintText: 'Select',
                          hintStyle: TextStyle(
                            // height: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1900), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            setState(() {
                              dateController.text =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(dateController.text);
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Phone number",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      controller:
                          phoneController, //editing controller of this TextField
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        filled: true,
                        counterText: "",
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        //icon of text field
                        hintText: '+970',
                        hintStyle: TextStyle(
                          // height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
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
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          // height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
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
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      obscureText: _isObscure1,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController2,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure1
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure1 = !_isObscure1;
                              });
                            }),
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Re-enter your password',
                        hintStyle: TextStyle(
                          // height: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: const Text(
                      "User type",
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text("Freelancer"),
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = 2;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text("Guest"),
                                Radio(
                                  value: 3,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = 3;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Company"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 160,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(140, 40),
                        primary: Color.fromRGBO(107, 17, 17, 1),
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () {
                        try {
                          firebase.signUpWithEmail(
                              emailController.text,
                              passwordController1.text,
                              nameController.text,
                              phoneController.text,
                              _value.toInt(),
                              "Hi, welcome to my profile",
                              "Engineer",
                              "Worked on many projects",
                              dateController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginDemo()));
                        } catch (e) {
                          showAlertDialog(context);
                        }
                      },
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
