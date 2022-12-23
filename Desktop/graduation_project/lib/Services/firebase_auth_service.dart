import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HostFireBaseAuthService {
  signUpWithEmail(String email, String password, String name, String phone,
      int userType, String bio, String position, String experinces);

  signInWithEmail(String email, String password);
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
  signUpWithEmail(String email, String password, String name, String phone,
      int userType, String bio, String position, String experinces) async {
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
          'DateOfBirth': DateTime.now(),
          'Phone': phone,
          'UserType': userType,
          'Bio': bio,
          'WorkPosition': position,
          'Experinces': experinces,
        });
      });
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
