import 'package:filmuygulamasi/classes/Filmler.dart';
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
    var filmListesi=<Filmler>[];

    var k1=Kategoriler(1, "Aksiyon");
    var k2=Kategoriler(2, "Bilim Kurgu");
    var k3=Kategoriler(3, "Macera");
    var k4=Kategoriler(4, "Aile");

    var y1=Yonetmenler(1, "Yaşar Timaçin");

    //var f10=Filmler(filmId, FilmAdi, filmYil, filmResim, yonetmenler, kategoriler)
    var f1=Filmler(1, "Avatar", 2015, "Avatar.jpg", y1, k2);
    var f2=Filmler(2, "Batman", 2015, "Batman.jpg", y1, k1);
    var f3=Filmler(3, "Bizim Hikaye", 2015, "BH.jpg", y1, k4);
    var f4=Filmler(4, "Diriliş", 2015, "Diriliş.jpg", y1, k3);
    var f5=Filmler(5, "Güneşi Gördüm", 2015, "GG.jpg", y1, k4);
    var f6=Filmler(6, "Hobbit", 2015, "Hobbit.jpg", y1, k3);
    var f8=Filmler(8, "Mucize", 2015, "Mucize.jpg", y1, k4);
    var f9=Filmler(9, "Süperman", 2015, "Süperman.jpg", y1, k2);
    var f7=Filmler(7, "Yüzüklerin Efendisi", 2015, "YE.jpg", y1, k1);


    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);
    filmListesi.add(f7);
    filmListesi.add(f8);
    filmListesi.add(f9);
  
    return filmListesi;

  }

  @override
  Widget build(BuildContext context) {
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
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(),));},
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
