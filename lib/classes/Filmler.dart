import 'package:filmuygulamasi/classes/Kategoriler.dart';
import 'package:filmuygulamasi/classes/Yonetmenler.dart';

class Filmler{
  int filmId;
  String FilmAdi;
  int filmYil;
  String filmResim;
  Kategoriler kategoriler;
  Yonetmenler yonetmenler;


  Filmler(this.filmId, this.FilmAdi, this.filmYil, this.filmResim,this.yonetmenler,this.kategoriler);
}