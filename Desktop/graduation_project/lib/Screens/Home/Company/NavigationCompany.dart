import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Login/Login.dart';
import '../../Profile/editProfile.dart';
import '../../Profile/profile.dart';

class NavigationCompany extends StatefulWidget {
  const NavigationCompany({Key? key}) : super(key: key);

  @override
  _NavigationCompanyState createState() => _NavigationCompanyState();
}

class _NavigationCompanyState extends State<NavigationCompany> {
  var _name = null;
  var _email = null;
  var _image = null;

  @override
  void initState() {
    getvalues().then((list) {
      setState(() {
        _email = list[0];
        _name = list[1];
        _image = list[2];
      });
      this.build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(107, 17, 17, 1)),
            accountName: Text(
              (_name ?? ''),
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              (_email ?? ''),
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 4),
                // color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Image.network((_image ?? ' ')),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile())),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Edit Profile'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => EditProf())),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          ListTile(
            title: Text(
              'For Me',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Contacts'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.wysiwyg),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Projects'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.work_outlined),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Job'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.model_training),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Training'),
            onTap: () => null,
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            //  onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            iconColor: Color.fromRGBO(107, 17, 17, 1),
            title: Text('Logout'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginDemo())),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Future<List<String?>> getvalues() async {
    // 1
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String?> values = [
      prefs.getString('email'),
      prefs.getString('name'),
      prefs.getString("picture")
    ];
    return (values);
  }
}
