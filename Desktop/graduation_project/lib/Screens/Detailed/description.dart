import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ForgetPassword/ForgetPassword.dart';
import 'package:untitled/Screens/Home/Company/Company.dart';
import 'package:untitled/Screens/Home/Freelancer/Freelancer.dart';
import 'package:untitled/Screens/Home/Guest/Guest.dart';
import 'package:untitled/Screens/SignUp/SiguUp.dart';

import '../../Services/firebase_auth_service.dart';

class DetailedWindow extends StatefulWidget {
  @override
  _DetailedWindowState createState() => _DetailedWindowState();
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _DetailedWindowState extends State<DetailedWindow> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    HostFireBaseAuth firebase = HostFireBaseAuth();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(102, 17, 17, 1),
        title: Center(
          child: Text('Project Title'),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.sanity.io/images/s7xbv9bz/production/1562d4dae8dc03456edca898e89c0f39ae086a8f-1600x1000.png?w=1200&h=750&auto=format&fm=webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.sanity.io/images/s7xbv9bz/production/1562d4dae8dc03456edca898e89c0f39ae086a8f-1600x1000.png?w=1200&h=750&auto=format&fm=webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.sanity.io/images/s7xbv9bz/production/1562d4dae8dc03456edca898e89c0f39ae086a8f-1600x1000.png?w=1200&h=750&auto=format&fm=webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 380.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
              child: Text(
                'Employment Application',
                style: TextStyle(
                  color: Colors.black.withOpacity(1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.attach_money,
                          size: 17,
                          color: Color.fromRGBO(107, 17, 17, 1),
                        ),
                      ),
                      TextSpan(
                        text: "1000",
                        style: TextStyle(
                          color: Color.fromRGBO(107, 17, 17, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.date_range,
                          size: 17,
                          color: Color.fromRGBO(107, 17, 17, 1),
                        ),
                      ),
                      TextSpan(
                        text: "12/12/2023",
                        style: TextStyle(
                          color: Color.fromRGBO(107, 17, 17, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Description',
                style: TextStyle(
                  color: Colors.black.withOpacity(1.0),
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'An application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services usinAn application of mobile commerce that includes the sale and purchase of goods and services using handheld devices ',
                style: TextStyle(
                  color: Colors.black.withOpacity(1.0),
                  fontSize: 12,
                ),
              )),
          Row(
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
                    'Emil Abulail',
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
                    'Email@gmail.com',
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
                padding: EdgeInsets.fromLTRB(100, 0, 20, 0),
                child: IconButton(
                    icon: const Icon(
                      Icons.chat_bubble,
                      color: Color.fromRGBO(107, 17, 17, 1),
                      size: 40,
                    ),
                    onPressed: () {}),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(140, 40),
                  primary: Color.fromRGBO(107, 17, 17, 1),
                ),
                child: const Text(
                  'Delete',
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(107, 17, 17, 1),
                  minimumSize: Size(140, 40),
                ),
                child: const Text('Apply'),
                onPressed: () {},
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
    );
  }
}
