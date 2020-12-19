import 'package:flutter/material.dart';
//import 'home_page.dart';
import 'Hompage.dart';

class SplashScreen extends StatelessWidget {
  static final String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(seconds: 3))
    //  .then((value) => {Navigator.pushNamed(context, Hompage.id)});

    return Scaffold(
      //extendBody: LinearGradient(),
      //backgroundColor: LinearGradient(),
      body: Center(
        child: Hero(
          tag: 'rail_tag',
          child: CircleAvatar(
            radius: 100.0,
            backgroundColor: Colors.yellow,
            child: Text(
              '            Rail Connect',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.bold),
            ),
          ),
          transitionOnUserGestures: true,
        ),
      ),
    );
  }
}
