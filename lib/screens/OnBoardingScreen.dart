import 'package:flutter/material.dart';
import 'package:flutterp/Shared/SharedUi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterp/screens/HomeScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> svg_pics = [
    "assets/test1.svg",
    "assets/test2.svg",
    "assets/test3.svg"
  ];
  List<String> titles = ["Aides soignants", "Kinésithérapeutes", "Infirmiers"];
  List<String> descriptions = [
    "Le métier d'aide-soignant fait partie des professions paramédicales. Son activité se centre principalement sur l'aide aux personnes soignées dans l’incapacité d'assumer seules leurs besoins primaires. Il assure également le maintien de l'hygiène hospitalière en collaboration avec l'agent des services hospitaliers.",
    "Le masseur-kinésithérapeute réalise, de façon manuelle ou instrumentale, des actes de massage et de gymnastique médicale, dans le but de prévenir l'altération des capacités fonctionnelles, de concourir à leur maintien et, lorsqu'elles sont altérées, de les rétablir ou d'y suppléer",
    "Dispensent des soins de nature préventive, curative ou palliative, visant à promouvoir, maintenir et restaurer la santé, ils contribuent à l'éducation à la santé et à l'accompagnement des personnes ou des groupes dans leur parcours de soins en lien avec leur projet de vie."
  ];
  int currentId = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 6,
                      child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (value) {
                            setState(() {
                              currentId = value;
                            });
                          },
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return descriptionPage(titles[index],
                                descriptions[index], svg_pics[index]);
                          })),
                  Expanded(
                      flex: 1,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(3, (index) => buildDot(index)))),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: TextButton(
                            onPressed: () {
                              if(currentId==2){
                                setState(() {
                                  Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
                                });
                              }
                              currentId = currentId + 1;
                              pageController.animateToPage(currentId,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            },
                            child: Text("Suivant",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black, size: 20),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  /* borderRadius: new BorderRadius.only( 
                  bottomLeft: Radius.elliptical(MediaQuery.of(context).size.width / 2, 50),
                  bottomRight: Radius.elliptical(MediaQuery.of(context).size.width / 2, 50),
                ), */
                  //borderRadius: BorderRadius.circular(25),
                  color: Colors.white)),
        ]),
      ),
    );
  }

  AnimatedContainer buildDot(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(4.0),
      width: index == currentId ? 14 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == currentId ? Colors.cyan : Colors.grey),
      duration: Duration(milliseconds: 500),
    );
  }
}

class descriptionPage extends StatelessWidget {
  String title = "";
  String description = "";
  String img = "";

  descriptionPage(title, description, img) {
    this.title = title;
    this.description = description;
    this.img = img;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.grey[100] as Color,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 25),
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  img,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                          child: Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            description,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        )
      );
  }
}
