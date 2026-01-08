import 'package:fist_app/model/myVideo.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyPlayerVideo extends StatefulWidget {
  MyVideo video;
  MyPlayerVideo({super.key,required this.video});

  @override
  State<MyPlayerVideo> createState() => _MyPlayerVideoState();
}

class _MyPlayerVideoState extends State<MyPlayerVideo> {
  late VideoPlayerController controller;
  bool isPaused = false;
  double position = 0;
  double maxVideo=0;
  double lecture= 0;
  @override
  void initState() {
    // TODO: implement initState
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.video.liens))..initialize().then((onvalue){
      setState(() {



      });
      controller.addListener(() {
        position = controller.value.position.inMilliseconds.toDouble();
        maxVideo = controller.value.duration.inMilliseconds.toDouble();

      });


    });




    
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.titre, style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                  image: NetworkImage(widget.video.image!),
                fit: BoxFit.fill,
                //colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.5), BlendMode.clear)
              )
            ),

          ),
          Container(
            child: Column(
              children: [
                Container(
                  height:MediaQuery.of(context).size.height * 0.6,
                    child: VideoPlayer(controller)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){


                        },
                        icon: Icon(Icons.fast_rewind)
                    ),
                    IconButton(
                        onPressed: (){
                          setState(() {
                          if(isPaused){
                            controller.pause();

                          }else {
                            controller.play();
                          }
                          isPaused=!isPaused;


                          });


                        },
                        icon: Icon((!isPaused)?Icons.play_arrow_sharp:Icons.pause,size: 50,color: Colors.white,)
                    ),
                    IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.fast_forward_rounded)
                    ),
                  ],
                ),
                /*Slider(
                    value: position/maxVideo,
                    min: 0,
                    max: maxVideo/maxVideo,


                    onChanged: (value){
                  setState(() {
                    position = controller.value.position.inMilliseconds.toDouble();
                    position = value;

                  });
                    }
                )*/
              ],
            ),
          )

        ],
      ),
    );
  }
}
