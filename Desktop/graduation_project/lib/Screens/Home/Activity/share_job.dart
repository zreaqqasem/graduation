import 'package:flutter/material.dart';
import 'package:untitled/Services/firebase_auth_service.dart';
import '../Company/Company.dart';

class ShareJob extends StatefulWidget {
  @override
  _ShareJobUIState createState() => _ShareJobUIState();
}

class _ShareJobUIState extends State<ShareJob> {
  int? _value = 0;
  int? _value1 = 0;
  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HostFireBaseAuth firebase = HostFireBaseAuth();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Share A Job'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.transparent)
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.a_7kR4Bb9X9cokw2lyDrWAHaE6?pid=ImgDet&rs=1')),
                      ),
                    ),
                    Positioned(
                        bottom: -5,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Color.fromRGBO(107, 17, 17, 1),
                            foregroundColor: Color.fromRGBO(107, 17, 17, 1),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              buildTextField("Job title", "Type here",
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)), title),
              buildTextField(
                  "Company",
                  "Type here",
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  company),
              Container(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                )),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        textAlign: TextAlign.left,
                        'Workplace type',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value as int?;
                                });
                              },
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text("On-site"),
                            Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value as int?;
                                });
                              },
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text("Remote"),
                            Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value as int?;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Hybrid"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                )),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        textAlign: TextAlign.left,
                        'Job type',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value as int?;
                                });
                              },
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text("Full-Time"),
                            Radio(
                              value: 1,
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value as int?;
                                });
                              },
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text("Part-Time"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField(
                  "Description",
                  "Add skills and requirements you are looking for",
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  description),
              SizedBox(
                height: 5,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: OutlinedButton(
                      onPressed: () {
                        firebase.postJob(title.text, company.text, _value,
                            _value1, description.text);
                        Navigator.of(context).pop();
                      },
                      child: Text("Share",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            color: Colors.white,
                          )),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(200.0, 50.0),
                        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelt, String placeholder, IconButton iconb,
      TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
            suffixIcon: iconb,
            contentPadding: EdgeInsets.only(bottom: 2),
            labelText: labelt,
            labelStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                height: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey)),
      ),
    );
  }
}
