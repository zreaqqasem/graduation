import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Screens/ForgetPassword/ForgetPassword.dart';
import 'package:untitled/Screens/Login/Login.dart';

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
  //bool guest = false;
  //bool company = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController1 = TextEditingController();
    TextEditingController passwordController2 = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController dateController = TextEditingController();
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
            child: new SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginDemo()));
                    },
                  ),
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
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Enter your name',
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
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Email',
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
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
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
                            labelText: "Select" //label text of field

                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = pickedDate.toString();
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateController.text =
                                  formattedDate; //set output date to TextField value.
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
                    height: 55,
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,

                      controller:
                          phoneController, //editing controller of this TextField
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          filled: true,
                          fillColor: Color.fromRGBO(0x8f, 0x8e, 0x8e, 0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          //icon of text field
                          labelText: "+970" //label text of field

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
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
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
                        labelText: 'Enter your password',
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
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
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
                        labelText: 'Re-enter your password',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
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
                    height: 150,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListView(
                      children: values.keys.map((String key) {
                        return CheckboxListTile(
                          checkColor: Colors.white,
                          title: new Text(key),
                          value: values[key],
                          onChanged: (value) {
                            setState(() {
                              values[key] = value!;
                              print(values);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
