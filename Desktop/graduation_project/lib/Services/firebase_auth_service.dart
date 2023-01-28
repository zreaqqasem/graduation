import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/user.dart';

abstract class HostFireBaseAuthService {
  signUpWithEmail(
      String email,
      String password,
      String name,
      String phone,
      int userType,
      String bio,
      String position,
      String experinces,
      String date);

  signInWithEmail(String email, String password);
  checkUserType(String email);
  updateProfile(String email, String name, String birth, String phone,
      String bio, String position, String experinces);
}

class HostFireBaseAuth extends HostFireBaseAuthService {
  @override
  signInWithEmail(String email, String password) async {
    try {
      // final credential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  signUpWithEmail(
      String email,
      String password,
      String name,
      String phone,
      int userType,
      String bio,
      String position,
      String experinces,
      String date) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('UserData')
            .doc(value.user?.email)
            .set({
          'Name': name,
          'Picture': '',
          'DateOfBirth': date,
          'Phone': phone,
          'UserType': userType,
          'Bio': bio,
          'WorkPosition': position,
          'Experinces': experinces,
          'email': email,
          'Friends': 0,
          'WorkedProjects': 0,
          'Trainings': 0,
        });
      });
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<int?> checkUserType(String email) async {
    final type =
        FirebaseFirestore.instance.collection('UserData').doc(email.toString());
    final snapshot = await type.get();
    if (snapshot.exists) {
      int? type = UserAccount.fromJson(snapshot.data()!).user_type;
      print(type);
      return type;
    }
  }

  Future<int?> saveLoginInformation(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final user =
        FirebaseFirestore.instance.collection('UserData').doc(email.toString());
    final snapshot = await user.get();
    if (snapshot.exists) {
      String? bio = UserAccount.fromJson(snapshot.data()!).bio;
      DateTime? date = UserAccount.fromJson(snapshot.data()!).date_of_birth;
      String? exper = UserAccount.fromJson(snapshot.data()!).experinces;
      String? name = UserAccount.fromJson(snapshot.data()!).name;
      String? phone = UserAccount.fromJson(snapshot.data()!).phone;
      String? pic = UserAccount.fromJson(snapshot.data()!).photo;
      int? user_type = UserAccount.fromJson(snapshot.data()!).user_type;
      String? position = UserAccount.fromJson(snapshot.data()!).work_pos;
      int? friends = UserAccount.fromJson(snapshot.data()!).friends;
      int? trainings = UserAccount.fromJson(snapshot.data()!).trainings;
      int? projects = UserAccount.fromJson(snapshot.data()!).projects;

      pref.setString("email", email);
      pref.setString("bio", bio!);
      pref.setString("birth", date.toString());
      pref.setString("exp", exper!);
      pref.setString("name", name!);
      pref.setString("phone", phone!);
      pref.setString(
          "picture", "https://cdn-icons-png.flaticon.com/512/6522/6522516.png");
      pref.setString("position", position!);
      pref.setInt("user_type", user_type!);
      pref.setInt("friends", friends!);
      pref.setInt("trainings", trainings!);
      pref.setInt("projects", projects!);
    }
  }

  @override
  updateProfile(String email, String name, String birth, String phone,
      String bio, String position, String experinces) {
    FirebaseFirestore.instance
        .collection('UserData')
        .doc(email.toString())
        .update({
      'Name': name,
      'Picture': '',
      'DateOfBirth': DateTime.parse(birth),
      'Phone': phone,
      'Bio': bio,
      'WorkPosition': position,
      'Experinces': experinces,
    }).then((value) => saveLoginInformation(email));
  }

  void postJob(
      String text, String text2, int? value, int? value1, String text3) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var id = text + "-" + pref.getString('email')!;
    print(id);
    FirebaseFirestore.instance.collection('Job').doc(id).set({
      'Title': text,
      'Picture': '',
      'company': text2,
      'workplace': value,
      'type': value1,
      'description': text3,
      'appliers': '',
      'owner': pref.getString('email')
    });
  }

  void postTraining(String title, String hours, int? value, String startdate,
      String enddate, String price, String description) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = title + "-" + pref.getString('email')!;
    FirebaseFirestore.instance.collection('Training').doc(id).set({
      'Title': title,
      'Picture': '',
      'Hours': hours,
      'type': value,
      'startDate': startdate,
      'EndDate': enddate,
      'price': price,
      'description': description,
      'appliers': '',
      'owner': pref.getString('email')
    });
  }

  void postProject(String title, String type, String date, String price,
      String description) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var id = title + "-" + pref.getString('email')!;
    FirebaseFirestore.instance.collection('Project').doc(id).set({
      'Title': title,
      'Picture': '',
      'Type': type,
      'deadline': date,
      'Price': price,
      'description': description,
      'appliers': '',
      'owner': pref.getString('email')
    });
  }
}
