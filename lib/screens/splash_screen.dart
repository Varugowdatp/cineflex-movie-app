import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    return Scaffold(
      body: Center(
        child: Image.asset('images/cineflix.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
