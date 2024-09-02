import 'package:filmuygulamasi/classes/Filmler.dart';
import 'package:filmuygulamasi/classes/Filmlerdao.dart';
import 'package:filmuygulamasi/classes/Kategoriler.dart';
import 'package:filmuygulamasi/classes/Yonetmenler.dart';
import 'package:filmuygulamasi/pages/DetaySayfa.dart';
import 'package:flutter/material.dart';

class Filmlersayfa extends StatefulWidget {
Kategoriler kategori;


Filmlersayfa({required this.kategori});

  @override
  State<Filmlersayfa> createState() => _FilmlersayfaState();
}

class _FilmlersayfaState extends State<Filmlersayfa> {


  Future<List<Filmler>>tumFilmleriGoster(int kategoriId) async{

    var filmListesi=await Filmlerdao().tumFilmlerByKategoriId(kategoriId);
    print("Gelen Kategoriler: $filmListesi");
    return filmListesi;

  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;


    return Scaffold(
      appBar: AppBar(title: Text("${widget.kategori.kategoriAd} Filmleri"),),
      body:FutureBuilder<List<Filmler>>(
          future: tumFilmleriGoster(widget.kategori.kategoriId),
          builder: (context, snapshot) {
            if(snapshot.hasData)
            {
              var filmListesi=snapshot.data;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/3.5
                  ),
                  itemCount: filmListesi!.length,
                  itemBuilder: (context, index) {
                    var film=filmListesi[index];
                    return GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(filmler: film,),));},
                      child:Card(
                        color: Colors.lightBlueAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Padding(padding: EdgeInsets.all(5),child:
                        Image.asset("images/${film.filmResim}",),),
                        Text("${film.FilmAdi}",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                        ),
                      ],
                      ),
                    ),
                    );
                  },
              );
            }
            else
              {
return Center();
              }
          },
      ),
    
    );
  }
}
