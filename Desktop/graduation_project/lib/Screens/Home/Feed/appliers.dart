import 'package:flutter/material.dart';
import 'package:untitled/Screens/Home//Company/Company.dart';
import '../../Detailed/description.dart';

class appliers extends StatelessWidget {
  const appliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Appliers'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
      ),
      body: _Body(),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: bottom(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: 100,
                child: ListTile(
                  title: Text(
                    'Projects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  tileColor: Color.fromRGBO(107, 17, 17, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () => null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: 100,
                child: ListTile(
                  title: Text(
                    'Jobs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  tileColor: Color.fromRGBO(107, 17, 17, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () => {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: 100,
                child: ListTile(
                  title: Text(
                    'Trainings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  tileColor: Color.fromRGBO(107, 17, 17, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () => null,
                ),
              ),
              Divider(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 120,
              // width: 180,
              child: _drawCard(
                  context,
                  'Graphic Designer',
                  "Asal Technologies",
                  r'15$',
                  'https://th.bing.com/th/id/OIP.a_7kR4Bb9X9cokw2lyDrWAHaE6?pid=ImgDet&rs=1')),
          SizedBox(
              height: 120,
              // width: 180,
              child: _drawCard(
                  context,
                  'Graphic Designer',
                  "Asal Technologies",
                  r'15$',
                  'https://th.bing.com/th/id/OIP.a_7kR4Bb9X9cokw2lyDrWAHaE6?pid=ImgDet&rs=1')),
          SizedBox(
              height: 120,
              // width: 180,
              child: _drawCard(
                  context,
                  'Graphic Designer',
                  "Asal Technologies",
                  r'15$',
                  'https://th.bing.com/th/id/OIP.a_7kR4Bb9X9cokw2lyDrWAHaE6?pid=ImgDet&rs=1')),
          SizedBox(
              height: 120,
              // width: 180,
              child: _drawCard(
                  context,
                  'Graphic Designer',
                  "Asal Technologies",
                  r'15$',
                  'https://th.bing.com/th/id/OIP.a_7kR4Bb9X9cokw2lyDrWAHaE6?pid=ImgDet&rs=1')),
        ],
      ),
    );
  }
}

class bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Color.fromRGBO(107, 17, 17, 1),
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Company()));
            },
          ),
          IconButton(
            color: Color.fromRGBO(107, 17, 17, 1),
            icon: const Icon(Icons.dynamic_feed_rounded),
            onPressed: () {
              //write your script
            },
          ),
          IconButton(
            color: Color.fromRGBO(107, 17, 17, 1),
            icon: const Icon(Icons.chat),
            onPressed: () {
              //write your script
            },
          )
        ], // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

Widget _drawCard(BuildContext context, name, company, price, image) {
  return Card(
    color: Color.fromRGBO(107, 17, 17, 40),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Color.fromRGBO(107, 17, 17, 1), //<-- SEE HERE
        )),
    child: Container(
      height: 100,
      // color: Color(0xfff3d5d8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListTile(
                      textColor: Colors.white,
                      title: Text(
                        name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        company,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          child: Text(
                            price,
                            selectionColor: Colors.red,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.grey)))),
                          child: Text(
                            "Edit",
                            selectionColor: Colors.red,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            flex: 8,
          ),
        ],
      ),
    ),
    elevation: 8,
    margin: EdgeInsets.all(10),
  );
}
