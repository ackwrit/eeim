import 'package:fist_app/controller/myfirebasehelper.dart';
import 'package:fist_app/globale.dart';
import 'package:fist_app/model/myVideo.dart';
import 'package:fist_app/view/playerVideo.dart';
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
              return GridView.builder(


                physics: BouncingScrollPhysics(),
                itemCount: documents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 2),
                  itemBuilder: (context,index){
                  MyVideo video = MyVideo(documents[index]);
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPlayerVideo(video: video)));
                    },
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(video.image!),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 20,
                              top: 10,
                              child: IconButton(
                                  onPressed: (){

                                    if(monUtilisateur.favoris.contains(video.id)){
                                      monUtilisateur.favoris.remove(video.id);

                                    }
                                    else
                                      {
                                        monUtilisateur.favoris.add(video.id);

                                      }
                                    setState(() {
                                      Map<String,dynamic> data = {
                                        "FAVORIS":monUtilisateur.favoris
                                      };
                                      Myfirebasehelper().updateUser(monUtilisateur.id, data);
                                    });
                                    //metttre à jour la base de donnée



                                  },
                                  icon: (monUtilisateur.favoris.contains(video.id)?Icon(Icons.check,color: Colors.green,):Icon(Icons.add,color: Colors.red,)
                              )
                          ),
                          )
                        ],
                      ),
                    ),
                  );
                  }
              );
            }
          }
        }
    );
  }
}
