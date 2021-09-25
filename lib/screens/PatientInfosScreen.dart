import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterp/Shared/SharedUi.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              Text(
                "Bienvenue sur votre espace patient",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(SharedData.color_VioletDark),
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.6,
                  color: Color(SharedData.color_BlueLight),
                ),
              ),
              Text(
                "Afin de vous mettre en contact avec l'un des membres de notre personnel, veuillez vous assurer de remplir le formulaire avec les données exactes.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 15),
              ),

              SizedBox(height: 20),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),

              //Proche ou patient
              Column(children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 25,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Je suis :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text(
                          "Patient",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    )),
                    Container(
                        child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text(
                          "Proche",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    )),
                  ],
                ),
              ]),

              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),
              //Phone number
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 25,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Télephone : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Numéro de télephone',
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 25),

              Text(
                "Information du patient",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(SharedData.color_VioletDark),
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),

              SizedBox(height: 25),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),
              //Femme ou Homme
              Column(children: [
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset("assets/gender_icon.svg"),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Civilité :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text(
                          "Monsieur",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    )),
                    Container(
                        child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text(
                          "Madame",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    )),
                  ],
                ),
              ]),

              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),
              //nom et prenom
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 25,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Nom et prénom : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Nom',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Prénom',
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 15),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),
              //Date de naissance
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 25,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Date de naissance : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Implement a date picker here
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'jj/mm/aaaa',
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 15),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 15),
              //Adress
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 25,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Adresse : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Adresse',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Ville',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              )),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 0.5)),
                          hintText: 'Code postal',
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 15),
              Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Color(SharedData.color_BlueLight),
                ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "J'accepte les ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            "conditions générales ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        "de 'Care Up' ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    //TO-DO
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(SharedData.color_BlueLight),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text("Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400))),
                  )),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ));
  }
}
