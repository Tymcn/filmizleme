import 'package:filmuygulamasi/classes/Kategoriler.dart';
import 'package:filmuygulamasi/classes/VeritabaniYardimcisi.dart';

class Kategorilerdao{
  Future<List<Kategoriler>> tumKategorileriGetir()async{
    var db=await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM Kategoriler");
    
   return List.generate(maps.length, (i){
     var satir=maps[i];
     return Kategoriler(satir["kategoriId"], satir["kategoriAd"]);
    });

  }
}