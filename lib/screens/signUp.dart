import 'package:crypt/crypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterp/Models/user.dart';
import 'package:flutterp/Shared/AuthService.dart';
import 'package:flutterp/Shared/DataBase.dart';
import 'package:flutterp/Shared/SharedUi.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 
  final DateFormat dateFormat = DateFormat("MMM dd, yyyy");
  DateTime _date = DateTime.now().subtract(Duration(days: 4380));
  String stringValidator = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  Color _iconColor = Colors.black;
  Color _favIconColor = Colors.black;
  bool _securText = true;
  bool _eye = true;
  String _selectDate = "date de naissance";

Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Inscription réussie'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('votre compte a été créé avec succès,'),
              Text('vous pouvez utiliser vos coordonnées pour vous connecter.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("D'accord"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
  
  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().subtract(Duration(days: 4000)).year));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
    }
    birthdayController.text = dateFormat.format(_date);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: Text(" S'inscrire")),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Entrez vos coordonnées",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        hintText: "Nom",
                        labelText: "Nom",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (input) {
                        if (input != null) {
                          if (input.isNotEmpty) {
                            if(!RegExp("^[a-zA-Z ,.'-]+\$").hasMatch(input.toString())){
                              return "Les caractères spéciaux et les chiffres sont interdits";
                            }else{
                              return null;
                            }
                          } else {
                            return "Entrez votre nom";
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: familynameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        hintText: "Prénom ",
                        labelText: "Prénom ",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (input) {
                        if (input != null) {
                          if (input.isNotEmpty) {
                            if(!RegExp("^[a-zA-Z ,.'-]+\$").hasMatch(input.toString())){
                              return "Les caractères spéciaux et les chiffres sont interdits";
                            }else{
                              return null;
                            }
                          } else {
                            return "Entrez votre Prénom";
                          }
                        } else {
                          return "Entrez votre Prénom";
                        }
                      }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input != null) {
                          if (input.isNotEmpty) {
                            return null;
                          } else {
                            return "Entrez votre date de naissance";
                          }
                        }
                      },
                      readOnly: true,
                      onTap: _handleDatePicker,
                      controller: birthdayController,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black,),
                          labelText: "Date de naissance",
                          labelStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        hintText: "Numéro de téléphone ",
                        labelText: "Numéro de téléphone",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!=null) {
                          if(value.length<=7){
                            return "Entrez un numéro de téléphone approprié";
                          }
                          return null;
                        }else{
                          return "Entrez votre numéro de téléphone";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        hintText: "E-mail ",
                        labelText: "E-mail",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString())) {
                          return "Entrez une propre adresse mail";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _securText,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        hintText: "Mot de passe",
                        labelText: "Mot de passe",
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _securText = !_securText;
                              if (_favIconColor == Colors.black) {
                                _favIconColor =  Color(SharedData.color_BlueLight);
                              } else {
                                _favIconColor = Colors.black;
                              }
                            });
                          },
                          icon:
                              Icon(Icons.remove_red_eye_outlined, color: _favIconColor, size: 20,),
                        ),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (input) {
                        if (input != null) {
                          if (input.isNotEmpty ) {
                            if (input.length>7){
                              return null;
                            }else {
                              return "Mot de passe très court";
                            }
                          } else {
                            return "Entrez un mot de passe";
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: Text(stringValidator, style: TextStyle(color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show(status: 'loading...');
                            UserCredential? userCredential = await authService.registerWithEmailAndPassword(emailController.text, passwordController.text);
                            if(userCredential!=null){
                              await DataBase().create(CustomUser(
                                id: userCredential.user!.uid,
                                gender: "-",
                                birthday: birthdayController.text,
                                passwordHashed: Crypt.sha512(passwordController.text, salt: "").toString(), 
                                phoneNumber: phoneController.text,
                                name: nameController.text,
                                familyname: familynameController.text,
                                email: emailController.text,
                                firstTimeUse: true,
                                picURL: "-",
                                location: "-"
                              ));
                              EasyLoading.dismiss();
                              await _showMyDialog().then((value) => Navigator.pop(context));
                              setState(() {
                                stringValidator = "";
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
                            "S'inscrire",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                          width: double.infinity,
                          height: 60,
                        ),
                        textColor: Colors.white,
                        color:  Color(SharedData.color_BlueLight),
                        elevation: 5,
                        splashColor: Colors.blue[800],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
