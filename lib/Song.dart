import 'package:flutter/material.dart';

class SongInfo{
  String songName;
  String songPath;
  String imagePath;
  SongInfo( this.songName, this.songPath, this.imagePath);
  }

  class Song extends StatelessWidget{
   final SongInfo songInfo;
   const Song({ Key? key, required this.songInfo}): super(key: key);
   @override
    Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(songInfo.songName),
     ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/M3.png')),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );

  }
  }


