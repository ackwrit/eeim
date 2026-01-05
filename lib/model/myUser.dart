import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fist_app/globale.dart';

class MyUser {
  //attributs
  late String id;
  late String mail;
  String? pseudo;
  List favoris=[];
  String? avatar;




  //constructeur(s)
  MyUser(){
    id = "";
    mail = "";

  }

  MyUser.bdd(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    mail = data["EMAIL"];
    pseudo = data["PSEUDO"] ?? "Pas de pseudo";
    favoris = data["FAVORIS"] ?? [];
    avatar = data["AVATAR"] ?? imageDefault;



  }





  //méthode


}