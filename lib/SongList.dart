import 'package:flutter/material.dart';
import 'package:music_app/Song.dart';

class Songlist extends StatefulWidget {
  const Songlist({Key? key}) : super(key:key);
  @override
  _SonglistState createState() => _SonglistState();
}

class _SonglistState extends State<Songlist>{
  final List<SongInfo> Songs=[
    SongInfo(
      'Agar Tum Sath Ho',
      'assets/agar-tum-sath-ho.mp3',
      'assets/M2.png' ),
    SongInfo(
        'Lambiya',
        'assets/lambiya.mp3',
        'assets/M4.png' ),
    SongInfo(
        'Ranjha',
        'assets/ranjha.mp3',
        'assets/M6.png' ),
    SongInfo(
        'Sathiya',
        'assets/sathiya.mp3',
        'assets/M3.png' ),
    SongInfo(
        'Tere Bin Nahi Laage',
        'assets/tere-bin-nahi-laage.mp3',
        'assets/M5.png' ),
    SongInfo(
        'Ringtone',
        'assets/original-ringtone.mp3',
        'assets/M2.png' ),
    SongInfo(
        'Violin',
        'assets/dear-comrade-madhu-pole-violin-cover-edit-50410.mp3',
        'assets/M2.png' ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SONGS'),
        ),
      body: ListView.builder(
        itemCount: Songs.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(Songs[index].songName),
              leading: SizedBox(
                width: 50,
                height: 50,
                child:Image(image: AssetImage(Songs[index].imagePath)) ,
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Song(
                    songInfo: Songs[index],
                  )
                ));
              },
            ),
          );
        }
      ),
    );
  }
}