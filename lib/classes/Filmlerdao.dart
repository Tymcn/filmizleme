
import 'package:filmuygulamasi/classes/Filmler.dart';
import 'package:filmuygulamasi/classes/Kategoriler.dart';
import 'package:filmuygulamasi/classes/VeritabaniYardimcisi.dart';
import 'package:filmuygulamasi/classes/Yonetmenler.dart';

class Filmlerdao{
  Future<List<Filmler>>tumFilmlerByKategoriId(int kategoriId)async{
    var db=await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM Filmler,Kategoriler,Yonetmenler WHERE Filmler.KategoriId= Kategoriler.KategoriId and Filmler.YonetmenId=Yonetmenler.YonetmenId and Filmler.KategoriId=$kategoriId");

    
    return List.generate(maps.length, (i){
      var satir=maps[i];
      
      var k=Kategoriler(satir["kategoriId"], satir["kategoriAd"]);
      var y=Yonetmenler(satir["yonetmenId"], satir["yonetmenAd"]);
      var f=Filmler(satir["filmId"], satir["FilmAdi"], satir["filmYil"], satir["filmResim"], satir["yonetmenler"], satir["kategoriler"]);


      return f;
    });
  }



}