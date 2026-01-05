import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  String message;
  MyDashBoard({super.key ,required this.message});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma nouvelle page"),
      ),
      body: Text("Je me suis connecté avec cette adresse ${widget.message}"),

    );
  }
}