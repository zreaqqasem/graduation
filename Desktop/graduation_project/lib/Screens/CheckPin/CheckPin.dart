import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:code_input/code_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckPin(),
    );
  }
}

class CheckPin extends StatefulWidget {
  const CheckPin({Key? key}) : super(key: key);

  @override
  _CheckPinState createState() => _CheckPinState();
}

class _CheckPinState extends State<CheckPin> {
  @override
  TextEditingController pinController = TextEditingController();

  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(102, 17, 17, 1),
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
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: const Text(
                      'Verification',
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Enter verification code",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
                      ),
                    ),
                  ),
                  CodeInput(
                    length: 4,
                    keyboardType: TextInputType.number,
                    builder: CodeInputBuilders.rectangle(
                      border: Border(),
                      emptySize: Size(40, 40),
                      filledSize: Size(40, 40),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(107, 17, 17, 1),
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    spacing: 8,
                    onFilled: (value) => print('Your input is $value.'),
                    onDone: (value) => print('Your input is $value.'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 30,
                      width: 160,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(107, 17, 17, 1),
                        ),
                        child: const Text('Verify'),
                        onPressed: () {
                          print(emailController.text);
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const Text(
                      "If you didn't receive a code",
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        color: Color.fromRGBO(0x8f, 0x8e, 0x8e, 1),
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
                        child: const Text('Resend code'),
                        onPressed: () {
                          print(emailController.text);
                        },
                      )),
                  SizedBox(
                    height: 10,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
