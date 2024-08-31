import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {
  const Detaysayfa({super.key});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Film Detay Sayfası"),),
        body:Column(children: [],) );
  }
}
