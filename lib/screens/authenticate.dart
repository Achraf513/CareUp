import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterp/Shared/AuthService.dart';
import 'package:flutterp/Shared/SharedUi.dart';
import 'package:flutterp/screens/OnBoardingScreen.dart';
import 'package:flutterp/screens/signUp.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loginTwo.dart';

class AuthenticateScreen extends StatefulWidget {
  AuthenticateScreen({Key? key}) : super(key: key);
  final _sharedData = SharedData();

  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: SvgPicture.asset("assets/logo.svg")),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Allez ! essayez c'est gratuit",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginTwo()),
                    ).then((value) {
                      if (widget._sharedData.connected) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute( builder: (context) => OnBoardingScreen())
                        );
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            "Connectez-vous par e-mail",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 55,
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35)),
                            child: Center(
                                child: Icon(
                              Icons.mail,
                              size: 30,
                              color: Color(SharedData.color_greenLight),
                            ))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Vous n'avez pas de compte ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      child: Text(
                        "Créer un compte ",
                        style:
                            TextStyle(color: Color(SharedData.color_BlueLight)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: OuComponent(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "utiliser l'un des réseaux sociaux",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async{
                    
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            "Connectez-vous par facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 55,
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35)
                                ),
                            ),
                            Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Center(child: 
                                  SvgPicture.asset("assets/facebook_icon.svg")
                                ,)
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    EasyLoading.show(status: 'loading...');
                    UserCredential? userCredential = await AuthService().signInWithGoogle();
                    if(userCredential!=null){
                      setState(() {
                        SharedData().connected = true;
                        EasyLoading.dismiss();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute( builder: (context) => OnBoardingScreen())
                        );
                      });
                    }else{
                      setState(() {
                        EasyLoading.dismiss();
                      });
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            "Connectez-vous avec gmail",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 55,
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35)),
                            child: Center(child: 
                              SvgPicture.asset("assets/google_plus_icon.svg")
                            ,)
                        ),
                      )
                    ],
                  ),
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0),
          child: Text("Ou",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300)),
        ),
        Expanded(
          child: Container(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
