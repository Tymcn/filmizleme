import 'package:filmuygulamasi/classes/Kategoriler.dart';
import 'package:filmuygulamasi/classes/Kategorilerdao.dart';
import 'package:filmuygulamasi/pages/FilmlerSayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  /*Future<List<Kategoriler>>tumKategorileriGetir()async{
    var kategoriListesi = <Kategoriler>[];
    var k1=Kategoriler(1, "Aksiyon");
    var k2=Kategoriler(2, "Aile");
    var k3=Kategoriler(3, "Suç");
    var k4=Kategoriler(4, "Savaş");
    var k5=Kategoriler(5, "Müzikal");
    var k6=Kategoriler(6, "Western");
    var k7=Kategoriler(7, "Korku");
    var k8=Kategoriler(8, "Animasyon");
    var k9=Kategoriler(9, "Spor");
    var k10=Kategoriler(10, "Komedi");
    var k11=Kategoriler(11, "Gerilim");
    var k12=Kategoriler(12, "Fantastik");
    var k13=Kategoriler(13, "Belgesel");
    var k14=Kategoriler(14, "Polisiye");
    var k15=Kategoriler(15, "Tarih");
    var k16=Kategoriler(16, "Aşk");
    var k17=Kategoriler(17, "Çocuk");
    var k18=Kategoriler(18, "Bilim Kurgu");
    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k4);
    kategoriListesi.add(k5);
    kategoriListesi.add(k6);
    kategoriListesi.add(k7);
    kategoriListesi.add(k8);
    kategoriListesi.add(k9);
    kategoriListesi.add(k10);
    kategoriListesi.add(k11);
    kategoriListesi.add(k12);
    kategoriListesi.add(k13);
    kategoriListesi.add(k14);
    kategoriListesi.add(k15);
    kategoriListesi.add(k16);
    kategoriListesi.add(k17);
    kategoriListesi.add(k18);
    return kategoriListesi;

  }

*/
 Future<List<Kategoriler>>tumKategorileriGoster()async{
    var kategorilerListesi=await Kategorilerdao().tumKategorileriGetir();
    print("Veritabanından gelen kategoriler: $kategorilerListesi");
    return kategorilerListesi;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Anasayfa"),
        ),
        body: FutureBuilder<List<Kategoriler>>(
          future: tumKategorileriGoster(),
          builder: (context, snapshot) {
            if(snapshot.hasData)
            {
              var kategoriListesi=snapshot.data;
              return ListView.builder(
                itemCount: kategoriListesi!.length,
                itemBuilder: (context, index) {
                  var kategori = kategoriListesi[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Filmlersayfa(kategori: kategori),));
                      },
                      child: Card(
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("${kategori.kategoriAd}",style: const TextStyle(fontSize: 18.0,color: Colors.white,),),
                            ),
                            const Padding(padding: EdgeInsets.all(16.0),child: Icon(Icons.list,color: Colors.white,),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else
            {
              return Center();
            }


          },
        )


    );
  }
}