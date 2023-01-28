import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Services/firebase_auth_service.dart';

class EditProf extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProf> {
  bool isObscurePassword = true;
  // var _name = null;
  // var _email = null;
  var _image = null;
  // var _date = null;
  // var _password = null;
  // var _phone = null;
  // var _bio = null;
  // var _exp = null;
  // var _position = null;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _expController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    getvalues().then((list) {
      setState(() {
        // _email = list[0];
        // _name = list[1];
        _image = list[2];
        // _date = list[3];
        // _phone = list[4];
        // _bio = list[5];
        // _exp = list[6];
        // _position = list[7];
        _emailController.text = list[0]!;
        _nameController.text = list[1]!;
        _dateController.text = list[3]!;
        _phoneController.text = list[4]!;
        _bioController.text = list[5]!;
        _expController.text = list[6]!;
        _positionController.text = list[7]!;
      });
      this.build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    HostFireBaseAuth firebase = HostFireBaseAuth();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
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
                            image: NetworkImage(_image ?? '')),
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
                height: 30,
              ),
              buildTextField(
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.drive_file_rename_outline)),
                  _nameController,
                  "Name"),
              buildTextField(
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.calendar_month)),
                  _dateController,
                  "Date of birth"),
              buildTextField(
                  IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                  _emailController,
                  "Email"),
              buildTextField(
                  IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                  _phoneController,
                  "Phone"),
              buildTextField(
                  IconButton(onPressed: () {}, icon: Icon(Icons.list_alt)),
                  _bioController,
                  "Bio"),
              buildTextField(
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.lightbulb_outline_sharp)),
                  _expController,
                  "Experinces"),
              SizedBox(
                height: 5,
              ),
              buildTextField(
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.lightbulb_outline_sharp)),
                  _positionController,
                  "Work position"),
              SizedBox(
                height: 5,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: OutlinedButton(
                      onPressed: () {
                        firebase.updateProfile(
                            _emailController.text,
                            _nameController.text,
                            _dateController.text,
                            _phoneController.text,
                            _bioController.text,
                            _positionController.text,
                            _expController.text);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("Update Profile",
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

  Future<List<String?>> getvalues() async {
    // 1
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String?> values = [
      prefs.getString('email'),
      prefs.getString('name'),
      prefs.getString("picture"),
      prefs.getString("birth"),
      prefs.getString("phone"),
      prefs.getString("bio"),
      prefs.getString("exp"),
      prefs.getString("position"),
    ];
    return (values);
  }

  Widget buildTextField(
      IconButton iconb, TextEditingController controller, label) {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: iconb,
              ),
            ),
          ],
        ));
  }
}
