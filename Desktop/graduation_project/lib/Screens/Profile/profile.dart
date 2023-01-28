import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<Profile> {
  int? _value = 1;
  var _name = null;
  var _email = null;
  var _image = null;
  var _date = null;
  var _password = null;
  var _phone = null;
  var _bio = null;
  var _exp = null;
  var _position = null;
  var _friends = null;
  var _trainings = null;
  var _projects = null;

  @override
  void initState() {
    getvalues().then((list) {
      setState(() {
        _email = list[0];
        _name = list[1];
        _image = list[2];
        _date = list[3];
        _phone = list[4];
        _bio = list[5];
        _exp = list[6];
        _position = list[7];
        _friends = list[8];
        _trainings = list[9];
        _projects = list[10];
      });
      this.build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
      ),
      body: Container(
        color: Color.fromRGBO(107, 17, 17, 1),
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 4,
                            blurRadius: 20,
                            color: Colors.transparent)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage((_image ?? ''))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text(
                  (_name ?? ''),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  (_position ?? ''),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(context, (_friends ?? ''), 'Friends', 'Friends',
                    ListView()),
                buildDivider(),
                buildButton(context, (_projects ?? ''), 'Worked Projects',
                    'Projects', ListView()),
                buildDivider(),
                buildButton(context, (_trainings ?? ''), 'Trainings',
                    'Trainings', ListView()),
                buildDivider(),
                buildButton(
                    context, '', 'Experinces', 'Experinces', ListView()),
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 55),
              child: Text(
                (_bio ?? ''),
                maxLines: 4,
                style:
                    TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                height: 4,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            buildrow("Phone", (_phone ?? '')),
            SizedBox(height: 4),
            buildrow("Email", (_email ?? '')),
            SizedBox(height: 50),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Add to Friends",
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
                        backgroundColor: Colors.grey)))
          ]),
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
      prefs.getInt("friends").toString(),
      prefs.getInt("trainings").toString(),
      prefs.getInt("projects").toString()
    ];
    print(values);
    return (values);
  }

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );

  Widget buildButton(BuildContext context, String value, String text,
      String text2, ListView list) {
    var body = "";

    if (text2 == 'Experinces') {
      body = _exp;
    } else if (text2 == 'Friends') {
    } else if (text2 == 'Trainings') {
    } else {}

    return MaterialButton(
      height: 10,
      minWidth: 5,
      color: Colors.grey,
      padding: EdgeInsets.all(5),
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(text2),
                  content: Text(body ?? ''),
                ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // IconButton(onPressed: (){}, icon: icon1),
          Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget buildrow(String label, String label2) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 55),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            VerticalDivider(width: 30),
            Text(
              label2,
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ));
  }
}
//   void _showModalSheet() {
//     showModalBottomSheet(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25.0),
//                 topRight: Radius.circular(25.0))),
//         context: context,
//         builder: (builder) {
//           return Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: PreferredSize(
//               preferredSize: AppBar().preferredSize,
//               child: SafeArea(
//                 child: Container(
//                   color: Colors.transparent,
//                   child: AppBar(
//                     title: Text(''),
//                     centerTitle: true,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25.0),
//                             topRight: Radius.circular(25.0))),
//                     backgroundColor: Color.fromRGBO(107, 17, 17, 1),
//                     leading: IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             body: Container(
//               color: Color.fromRGBO(107, 17, 17, 1),
//               padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//               child: GestureDetector(
//                 onTap: () {
//                   FocusScope.of(context).unfocus();
//                 },
//                 child: ListView(),
//               ),
//             ),
//           );
//         });
//   }
// }
