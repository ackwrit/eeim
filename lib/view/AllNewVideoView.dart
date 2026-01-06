import 'package:fist_app/controller/myfirebasehelper.dart';
import 'package:fist_app/model/myVideo.dart';
import 'package:flutter/material.dart';

class Allnewvideoview extends StatefulWidget {
  const Allnewvideoview({super.key});

  @override
  State<Allnewvideoview> createState() => _AllnewvideoviewState();
}

class _AllnewvideoviewState extends State<Allnewvideoview> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Myfirebasehelper().cloudVideos.snapshots(),
        builder: (context,snap){
          if(!snap.hasData){
            return Center(
              child: Text("Aucune donnée"),
            );
          } else {
            //temps de chargement
            if(snap.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              List documents = snap.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                  itemBuilder: (context,index){
                  MyVideo video =MyVideo(documents[index]);
                  //travailler sur le design

                  return ListTile(
                    title: Text(video.titre),
                    subtitle: Text(video.annee.toString()),

                  );
                  }
              );
            }
          }
        }
    );
  }
}
