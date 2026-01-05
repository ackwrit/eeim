
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Myfirebasehelper {
  final auth = FirebaseAuth.instance;
  final cloudUtilisateurs = FirebaseFirestore.instance.collection("UTILISTEURS");



  //inscription
inscription({required String email,required String password, String? pseudo}){
  auth.createUserWithEmailAndPassword(email: email, password: password);

}




//connexion
}