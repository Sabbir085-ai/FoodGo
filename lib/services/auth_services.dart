//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodgo/models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password for firebase authentication

  Future<User?> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String address,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "address": address,
          "createAt": DateTime.now(),
        });
      }
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Something Went Wrong ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }


  Future<UserModel?>GetUserProfile()async{


    try{
      User ? user = await _auth.currentUser!;
      // ignore: unnecessary_null_comparison
      if (user !=null){
        DocumentSnapshot doc =await _firestore.collection("users").doc(user.uid).get();
        if(doc.exists){
          Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
          return UserModel.fromJson(data);
        }
        return null;
      }


    }catch(e){
      throw Exception("Error fething profile data ${e.toString()}");

    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<UserModel?> getuserprofile() async {}
}
