import 'package:fist_app/controller/myfirebasehelper.dart';
import 'package:fist_app/globale.dart';
import 'package:fist_app/view/AllNewVideoView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDashBoard extends StatefulWidget {
  String message;
  MyDashBoard({super.key ,required this.message});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int selectedIndex = 0;
  String uiid = "";

  init() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    uiid = preferences.getString("UID") ?? "";
    if(!mounted) return;
    monUtilisateur = await Myfirebasehelper().getUser(uiid);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width * 0.33,
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
        ),

        child: Column(
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(monUtilisateur.avatar!),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text(monUtilisateur.mail),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(monUtilisateur.pseudo!),
            ),
            Divider(),
            Spacer(),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app_rounded),
              title: Text("Déconnexion"),
            ),

          ],
        ),
      ),

      appBar: AppBar(
        title: Text("Ma nouvelle page"),
      ),
      body: bodyPage(),
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

  Widget bodyPage(){
     switch(selectedIndex){
       case 0 : return Text("home");
       case 1: return Allnewvideoview();
       case 2: return Text("Favoris");
       default: return Text("Erreur");
     }

  }
}