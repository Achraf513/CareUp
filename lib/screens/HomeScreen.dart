import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterp/Shared/SharedUi.dart';
import 'package:flutterp/screens/PatientInfosScreen.dart';
import 'package:flutterp/screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double horizontalPadding = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profilePic.png"),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Achraf Affes", //TO-DO : Firebase
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                          }, //TO-DO
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                          width: 0, 
                          style: BorderStyle.none,
                      ),
                    ),
                    hintText: "vous cherchez quelqu'un?",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    /*  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ), */
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Passer une consultation ?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientScreen()));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(SharedData.color_greenLight),
                          ),
                          width: (MediaQuery.of(context).size.width -
                                  horizontalPadding * 3) /
                              3,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                child: SvgPicture.asset(
                                  "assets/nurse-2.svg"
                                )
                              ),
                              Text(
                                "Infirmiers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(SharedData.color_pinkLight),
                        ),
                        width: (MediaQuery.of(context).size.width -
                                horizontalPadding * 3) /
                            3,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 100,
                              child: SvgPicture.asset(
                                "assets/kine.svg"
                              )
                            ),
                             SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Kiné",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(SharedData.color_cyanLight),
                          ),
                          width: (MediaQuery.of(context).size.width -
                                  horizontalPadding * 3) /
                              3,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(
                              height: 5,
                            ),
                              Container(
                              height: 100,
                              child: SvgPicture.asset(
                                "assets/aideSoignat3.svg"
                              )
                            ),
                              Text(
                                "Aides",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "soignants",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "vous ne savez pas comment choisir ?",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "vous voulez de l'aide ?",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            //TO-DO
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[400],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text("Contacter nous",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400))),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text("Top soignant",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.w600))),
                    Expanded(flex: 5, child: SizedBox()),
                    Expanded(
                        flex: 2,
                        child: Text("Voir plus",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.w400))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    buildTopSoignant(context, "Kinésithérapeute", "Dr. Khalil S",
                        "https://st2.depositphotos.com/1518767/11721/i/950/depositphotos_117210926-stock-photo-portrait-of-physiotherapist-standing-with.jpg"),
                    buildTopSoignant(context, "Aides soignants", "Dr. Mourad S",
                        "https://st.focusedcollection.com/14026668/i/1800/focused_164883806-stock-photo-portrait-of-smiling-doctor.jpg"),
                    buildTopSoignant(context, "Infirmier", "Dr. Hamdi S",
                        "https://image.freepik.com/photos-gratuite/portrait-du-docteur-adulte-moyen-reussi-bras-croises_1262-12865.jpg"),
                    buildTopSoignant(context, "Kinésithérapeute", "Dr. Amira K",
                        "https://media.istockphoto.com/photos/portrait-of-female-doctor-against-wall-in-hospital-picture-id942262770?k=6&m=942262770&s=612x612&w=0&h=cVya1hNmtGm563tLR1YBeV5SkPrV1eLkAyN-pRAjd8g="),
                    buildTopSoignant(context, "Infirmiere", "Dr. Baya M",
                        "https://media.istockphoto.com/photos/portrait-of-confident-senior-female-doctor-in-scrubs-picture-id1061001352?k=6&m=1061001352&s=612x612&w=0&h=J4c-KRuBDDObAY5TVGwz7piALv3XvKwqOdMjDlPbDsQ="),
                    buildTopSoignant(context, "Aides soignants", "Dr. Akram A",
                        "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg"),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Container buildTopSoignant(
      BuildContext context, String position, String name, String pic) {
    return Container(
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 3, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width:
                (MediaQuery.of(context).size.width - horizontalPadding * 3) / 3,
            height: 165,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(pic)),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  position,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
