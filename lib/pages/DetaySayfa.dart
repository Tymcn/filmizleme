import 'package:filmuygulamasi/classes/Filmler.dart';
import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {
  Filmler filmler;


  Detaysayfa({required this.filmler});


  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;

    return Scaffold(
        appBar: AppBar(title: Text("${widget.filmler.FilmAdi} Filminin Detayı"),),
        body:Column(
          children: [
          Card(
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(width:ekranGenisligi/1,height: ekranYuksekligi/2,
                  child: Image.asset("images/${widget.filmler.filmResim}")),
            ),
            SizedBox(height: 30,),
            Text("${widget.filmler.FilmAdi}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text("${widget.filmler.filmYil}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text("${widget.filmler.yonetmenler.yonetmenAd}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),

          ],
          ),
          )
        ],
        ),
    );
  }
}
