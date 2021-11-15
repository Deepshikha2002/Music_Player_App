import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MusicApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key:key);
  @override
  _MusicAppState createState() => _MusicAppState();
}

  class _MusicAppState extends State<MusicApp>{
  bool playing= false;
  IconData playBtn= Icons.play_arrow;
  AudioPlayer _player;
  AudioCache cache;
  Duration position=new Duration();
  Duration musicLength=new Duration();
  Widget slider(){
  return Container(
  width: 300,
  child: Slider.adaptive(
  activeColor: Colors.blue[800],
  inactiveColor: Colors.grey[350],
  value:position.inSeconds.toDouble(),
  max:musicLength.inSeconds.toDouble(),
  onChanged: (value){
  seekTosec(value.toInt());
  }),
  );
  }
  void seekTosec(int sec){
  Duration nenPos= Duration(seconds: sec);
  _player.seek(nenPos);
  }
  @override
  void initState(){
  super.initState();
  _player=AudioPlayer();
  cache=AudioCache(fixedPlayer: _player);
  _player.onDurationChanged.listen((d) {
    setState((){
    musicLength=d;
  });
  });
  _player.onAudioPositionChanged.listen((p) {
  setState((){
  position=p;
  });
  });

  @override

  Widget build(BuildContext context)  {
    return Scaffold(
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration( gradient: LinearGradient(
    begin: Alignment.topLeft,
     end: Alignment.bottomRight,
     colors: [Colors.pink[800],
              Colors.pink[200],
     ]),
    ),
    child: Padding(
      padding: EdgeInsets.only(
         top: 48.0,
       ),
    child: Container(
       child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
             padding: const EdgeInsets.only(left: 12.0),
             child: Text(
              'Musically',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 38.0,
                 fontWeight: FontWeight.bold,
                 ),
               ),
              ),
            SizedBox(
              height: 24.0,
             ),
            Center(
               child: Container(
               width:280.0,
               height: 280.0,
               decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30.0),
               image: DecorationImage(
                  image: AssetImage(""),
                   )
                ),
              ),
            ),
             SizedBox(
               height: 18.0,
              ),
             Center(
               child: Text(
               'Lemonade',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
             SizedBox(
               height: 18.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                       ),
                     ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                  width: 500.0,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                  Text(
                  "${position.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                  style: TextStyle(
                 fontSize: 18.0,
                   ),
                  ),
                  slider(),
                  Text(
                  "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                  style: TextStyle(
                    fontSize: 18.0,
                     ),
                   ),
           ],
          ),
         ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              IconButton(
              iconSize: 45.0,
              color: Colors.blue
              onPressed: (){},
              icon: Icon(
                Icons.skip_previous,
                ),
              ),
              IconButton(
              iconSize: 62.0,
              color: Colors.blue[800],
              onPressed: (){
              if(!playing){
                cache.play("gg.mp3");
               setState((){
                playBtn=Icons.pause;
                playing=true;
                });
              }
             else{
               _player.pause();
                setState((){
                playBtn=Icons.play_arrow;
                playing=false;
                });
               }
              },
              icon: Icon(
              playBtn,
                ),
              ),
              IconButton(
              iconSize:45.0,
              color: Colors.blue,
              onPressed: (){},
              icon: const Icon(
                Icons.skip_next,
                ),
              ),
          ],
         )
        ],
       ),
       ),
       ),
       ],
    ),
    ),
    ),
    ),
    );
  }
  }




