import 'package:flutter/material.dart';

import '../../Login/Login.dart';

class NavigationGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(107, 17, 17, 1)),
            accountName: Text(
              'Guest',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              'Guest@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                  'https://scontent.fjrs25-1.fna.fbcdn.net/v/t39.30808-6/286499699_5555668931159722_7864494492427324668_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=971uPLCorgsAX-3LwAG&_nc_ht=scontent.fjrs25-1.fna&oh=00_AfCG_Szgy5sngSahk5jRu4pbfpRTyF5RG8Z3oSwJWGTotQ&oe=638860D1'),
            )),
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
            onTap: () => null,
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
}
