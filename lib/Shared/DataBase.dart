import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterp/Models/user.dart';

class DataBase{
  static final DataBase _dataBase= new DataBase._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory DataBase(){
    return _dataBase;
  }
  DataBase._internal();

  Future<List<QueryDocumentSnapshot>> read() async{
    QuerySnapshot querySnapshot;
    try{
      querySnapshot = await _firestore.collection("User").get();
      return querySnapshot.docs.toList();
    } catch (error){
       print(error);
       return [];
    }
  }

  Future<List<QueryDocumentSnapshot>> getUserData(String userId) async{
    QuerySnapshot querySnapshot;
    try{
      querySnapshot = await _firestore.collection("User").where({"id":userId}).get();
      return querySnapshot.docs.toList();
    } catch (error){
       print(error);
       return [];
    }
  }

  Future update(String id, String username) async{
    try{
      await _firestore.collection("User").doc(id).update({"username":username}); //add as many fields as u want in the map 
    } catch (error){
       print(error);
    }
  }

  Future create(CustomUser user) async{
    try{
      await _firestore.collection("User").add(user.toJSON()); //add as many fields as u want in the map 
    } catch (error){
       print(error);
    }
  }

  Future delete(String id) async {
    try {
      await _firestore.collection("User").doc(id).delete();
    } catch (error) {
      print(error);
    }
  }
}
