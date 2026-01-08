
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fist_app/model/myUser.dart';

class Myfirebasehelper {
  final auth = FirebaseAuth.instance;
  final cloudUtilisateurs = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudVideos= FirebaseFirestore.instance.collection("VIDEOS");



  //inscription
Future<MyUser>inscription({required String email,required String password, String? pseudo}) async{
  UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
  String uid = credential.user!.uid;
  Map<String,dynamic> data = {
    "EMAIL":email,
    "PSEUDO":pseudo
  };

  addUser(uid, data);
  return getUser(uid);

}

Future<MyUser>getUser(String uid) async {
  DocumentSnapshot snapshot = await cloudUtilisateurs.doc(uid).get();
  return MyUser.bdd(snapshot);

}

addUser(String uid,Map<String,dynamic> data){
  cloudUtilisateurs.doc(uid).set(data);
}


  updateUser(String uid,Map<String,dynamic> data){
    cloudUtilisateurs.doc(uid).update(data);
  }




//connexion
  Future<MyUser>connexion({required String email,required String password}) async{
    UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    return getUser(uid);

  }

}