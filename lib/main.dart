import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        title: 'Movie Listing App',
        theme: ThemeData(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
          ),
        ),
        home: SplashScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
        },
      ),
    );
  }
}
