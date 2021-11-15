import 'package:flutter/material.dart';
import 'Music.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Music_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

