import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterp/Shared/AuthService.dart';
import 'package:flutterp/Shared/SharedUi.dart';
import 'package:flutterp/screens/HomeScreen.dart';

class LoginTwo extends StatefulWidget {
  LoginTwo({Key? key}) : super(key: key);
  final _sharedData = SharedData();

  @override
  _LoginTwoState createState() => _LoginTwoState();
}

class _LoginTwoState extends State<LoginTwo> {
  TextEditingController emailController = TextEditingController();
  String stringValidator ="";
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _securText = true;
  final AuthService authService = AuthService();
  _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                            _goBack(context);
                          } ,
                      child: Container(
                        padding: EdgeInsets.only(top: 10, left : 20, right: double.infinity),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blue,
                            size: 30,
                          ),
                          iconSize: 20.0,
                          onPressed: () {
                            _goBack(context);
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Container(
                        child: SvgPicture.asset(
                          "assets/logo.svg"
                        )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "e-mail ?",
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            enabled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString())) {
                              return "S'il vous plaît, entrez votre adresse";
                            }
                            return null;
                          },
                        ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        obscureText: _securText,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "mot de passe ?",
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _securText = !_securText;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                          enabled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff1c9eeb), width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "S'il vous plaît, entrez votre mot de passe";
                          } else{
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: Text(stringValidator, style: TextStyle(color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show(status: 'loading...');
                            UserCredential? userCredential = await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                            if(userCredential!=null){
                              setState(() {
                                stringValidator = "";
                                SharedData().connected = true;
                                EasyLoading.dismiss();
                                Navigator.pop(context);
                              });
                            }else{
                              setState(() {
                                EasyLoading.dismiss();
                                stringValidator = "Please fill in with accuarate data";
                              });
                            }
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "Se connecter ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          width: double.infinity,
                          height: 55,
                        ),
                        color: Colors.blue,
                        elevation: 5,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                    InkWell(
                      child:  Text(
                        "mot de passe oublié ?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        print("bronze");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
