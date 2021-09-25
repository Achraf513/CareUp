import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterp/Models/user.dart';
import 'package:flutterp/Shared/DataBase.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _authService = new AuthService._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  factory AuthService() {
    return _authService;
  }
  AuthService._internal();

  //Create user object based on FireBaseUser
  /* CustomUser createUserFromFirebaseUser(UserCredential fireBaseUser) {
    return CustomUser(id : fireBaseUser.user!.uid);
  } */
  
  //Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e.code);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  //Sign in with facebook

  //Sign in with gmail
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =  await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user!=null){
        List<QueryDocumentSnapshot<Object?>> response = await DataBase().getUserData(userCredential.user!.uid);
        if(response.length!=0){
        }else{
          DataBase().create(
            CustomUser(
              id: userCredential.user!.uid,
              firstTimeUse: true, 
              birthday: "-", 
              email: userCredential.user!.email??"-", 
              gender: "-", 
              location: "-", 
              passwordHashed: "-", 
              phoneNumber: userCredential.user!.phoneNumber??"-", 
              picURL: userCredential.user!.photoURL??"-", 
              name: userCredential.user!.displayName??"-", 
              familyname: "-"
            )
          );
        }
      }
      return userCredential;
    }
    return null;
  }

  //Sign out
  

}
