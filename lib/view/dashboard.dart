import 'package:fist_app/globale.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  String message;
  MyDashBoard({super.key ,required this.message});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma nouvelle page"),
      ),
      body: Text(monUtilisateur.id),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (value){
          setState(() {
            selectedIndex = value;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper_rounded),label: "Nouveauté",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Mon NetFlix",backgroundColor: Colors.white)
            
          ]
      ),

    );
  }
}