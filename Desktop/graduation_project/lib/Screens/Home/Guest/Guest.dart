import 'package:flutter/material.dart';
import 'package:untitled/Screens/Home/Company/Company.dart';
import 'package:untitled/Screens/Home/Company/NavigationCompany.dart';
import 'dart:ui';
import 'package:untitled/Screens/Home/Guest/NavigationGuest.dart';

import '../../Detailed/description.dart';
import '../Activity/share_job.dart';
import '../Activity/share_proj.dart';
import '../Activity/share_train.dart';
import '../Feed/appliers.dart';
import '../Feed/justforyou.dart';

class Guest extends StatelessWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationGuest(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Guest'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: _Body(),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: bottom(),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottom(),
      appBar: AppBar(
        // The search area here
        backgroundColor: Color.fromRGBO(107, 17, 17, 1),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  iconColor: Colors.grey,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
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
          Container(
            width: double.maxFinite,
            height: 60,
            margin:
                const EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 50),
            decoration: BoxDecoration(
              color: Color.fromRGBO(107, 17, 17, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: RichText(
              text: TextSpan(
                text: "Welcome Back to",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Linka!',
                      style: TextStyle(color: Color.fromRGBO(147, 209, 253, 1)))
                ],
              ),
            )),
          ),
          SizedBox(
            height: 50,
            width: 180,
            child: ListTile(
              title: FloatingActionButton.extended(
                label: Text('Apply For A Job'), // <-- Text
                backgroundColor: Color.fromRGBO(107, 17, 17, 1),
                icon: Icon(
                  // <-- Icon
                  Icons.work,
                  size: 24.0,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => justforyou())),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 50,
            width: 180,
            child: ListTile(
              title: FloatingActionButton.extended(
                label: Text('Post A Project'), // <-- Text
                backgroundColor: Color.fromRGBO(107, 17, 17, 1),
                icon: Icon(
                  // <-- Icon
                  Icons.wysiwyg,
                  size: 24.0,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShareProj())),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 50,
            width: 180,
            child: ListTile(
              title: FloatingActionButton.extended(
                label: Text('Apply Fors A Training'), // <-- Text
                backgroundColor: Color.fromRGBO(107, 17, 17, 1),
                icon: Icon(
                  // <-- Icon
                  Icons.model_training,
                  size: 24.0,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => justforyou())),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Positioned(
                top: 5,
                left: 10,
                right: 10,
                child: ListTile(
                  trailing: Icon(Icons.arrow_downward),
                  title: Text(
                    'Just for You ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23,
                    ),
                  ),
                  onTap: () => null,
                ),
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
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              SizedBox(
                child: _showAppliers(context, "Emil Abulail", "Emil@gmail.com"),
              ),
              SizedBox(
                child: _showAppliers(context, "Emil Abulail", "Emil@gmail.com"),
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
            ],
          ),
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
                  context, MaterialPageRoute(builder: (context) => Guest()));
            },
          ),
          IconButton(
            color: Color.fromRGBO(107, 17, 17, 1),
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => justforyou()));
            },
          ),
          IconButton(
            color: Color.fromRGBO(107, 17, 17, 1),
            icon: const Icon(Icons.chat_bubble),
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
          color: Color.fromRGBO(107, 17, 17, 1),
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

Widget _showAppliers(BuildContext context, name, email) {
  return Row(
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://learn.microsoft.com/en-us/answers/storage/attachments/209536-360-f-364211147-1qglvxv1tcq0ohz3fawufrtonzz8nq3e.jpg'),
            ),
          ),
        ),
      ),
      Column(
        children: [
          Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            email,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black.withAlpha(200),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      Container(
        padding: EdgeInsets.fromLTRB(30, 0, 5, 0),
        child: IconButton(
            icon: const Icon(
              Icons.chat_bubble,
              color: Color.fromRGBO(107, 17, 17, 1),
              size: 30,
            ),
            onPressed: () {}),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
          child: Column(
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {}),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ))
    ],
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  );
}
