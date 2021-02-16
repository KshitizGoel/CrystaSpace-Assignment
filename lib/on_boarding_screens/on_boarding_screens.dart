import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

import '../authentication/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return LoginPage();
            })),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return LoginPage();
            })),
      ),
    );
  }

  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/images/first_image.png',
        title: Text('CrystaSpace'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('Welcome to the best Interior Designers in World',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/icon_image_path/icon_image.png'
    ),
    PageModel(
        color: Colors.indigo[400],
      heroImagePath: 'assets/images/second_image.png',
        title: Text('DESIGN YOUR INTERIORS',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'Professional Interior Designer For Your Space',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/icon_image_path/icon_image.png'
    ),
    PageModel(
      color: Colors.blue[900],
      heroImagePath: 'assets/images/third_image.png',
      title: Text('Continue',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Let's start the journey!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
        iconImagePath: 'assets/icon_image_path/icon_image.png'

    ),

  ];
}
