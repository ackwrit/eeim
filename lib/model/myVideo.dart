import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fist_app/globale.dart';

class MyVideo {
  late String id;
  late String titre;
  late String liens;
  String? desc;
  String? image;
  DateTime? annee;


  //constructeur
  MyVideo(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    titre = data["TITRE"];
    liens = data["LIENS"];
    desc = data["DESC"] ?? "";
    image = data["IMAGE"] ?? imageDefault;
    Timestamp? timestamp = data["ANNEE"];
    if(timestamp == null){
      annee= DateTime.now();
    }else {
      annee = timestamp.toDate();
    }
  }
}