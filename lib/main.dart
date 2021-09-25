import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterp/Shared/DataBase.dart';

import 'screens/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  EasyLoading.instance
  ..userInteractions = false
  ..dismissOnTap = false
  ..maskType = EasyLoadingMaskType.custom
  ..maskColor = Colors.black.withOpacity(0.5);
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: AuthenticateScreen(),
      ),
      builder: EasyLoading.init(),
    );
  }
}
