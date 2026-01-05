
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Myfirebasehelper {
  final auth = FirebaseAuth.instance;
  final cloudUtilisateurs = FirebaseFirestore.instance.collection("UTILISATEURS");



  //inscription
inscription({required String email,required String password, String? pseudo}) async{
  UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
  String uid = credential.user!.uid;
  Map<String,dynamic> data = {
    "EMAIL":email,
    "PSEUDO":pseudo
  };

  addUser(uid, data);

}

addUser(String uid,Map<String,dynamic> data){
  cloudUtilisateurs.doc(uid).set(data);
}




//connexion
  connexion({required String email,required String password}){
    auth.signInWithEmailAndPassword(email: email, password: password);

  }

}