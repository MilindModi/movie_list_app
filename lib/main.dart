import 'package:flutter/material.dart';
import 'package:movie_list_app/network/movie.dart';
import 'package:movie_list_app/screen/home_screen.dart';

import 'network/API.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
