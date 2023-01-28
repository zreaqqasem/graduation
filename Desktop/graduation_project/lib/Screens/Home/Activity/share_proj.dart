import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Services/firebase_auth_service.dart';

class ShareProj extends StatefulWidget {
  @override
  _ShareProjUIState createState() => _ShareProjUIState();
}

class _ShareProjUIState extends State<ShareProj> {
  // int? _value = 1;
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  String? _svalue;
  List<String> listofproj = [
    'Frontend',
    'Backend',
    'Full-Stack',
    'Programming',
    'Accounting',
    'Marketing'
  ];
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HostFireBaseAuth firebase = HostFireBaseAuth();

    return Scaffold(
      appBar: AppBar(
        title: Text('Share Project'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              buildTextField("Project title", "Type here",
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)), title),
              DropdownButtonFormField(
                value: _svalue,
                onChanged: (value) {
                  setState(() {
                    _svalue = value as String?;
                  });
                },
                decoration: InputDecoration(
                    //suffixIcon:IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    contentPadding: EdgeInsets.only(bottom: 2),
                    labelText: "Project Type",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Select your project type",
                    hintStyle: TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                items:
                    listofproj.map<DropdownMenuItem<String>>((String value1) {
                  return DropdownMenuItem<String>(
                    child: Text(value1),
                    value: value1,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: date,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.calendar_month)),
                    contentPadding: EdgeInsets.only(bottom: 0.5),
                    labelText: "Project deadline",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Select here",
                    hintStyle: TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                onTap: () async {
                  DateTime? pickdate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if (pickdate != null) {
                    setState(() {
                      date.text = DateFormat('dd-MM-yyyy').format(pickdate);
                    });
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Price", "Type here",
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)), price),
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
                        firebase.postProject(title.text, _svalue!, date.text,
                            price.text, description.text);
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
      TextEditingController contorller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: contorller,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
            suffixIcon: iconb,
            contentPadding: EdgeInsets.only(bottom: 0.5),
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
