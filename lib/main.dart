import 'package:firebase_core/firebase_core.dart';
import 'package:fist_app/controller/my_animation.dart';
import 'package:fist_app/controller/myfirebasehelper.dart';
import 'package:fist_app/firebase_options.dart';
import 'package:fist_app/view/dashboard.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(

          title: Text("Ma première application",
              style:TextStyle(color: Colors.amber)),
          backgroundColor:Colors.blue,




        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  //image

                  MyAnimation(
                    duree: 1,
                    child: Container(
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("lib/images/night.jpg"),
                              fit: BoxFit.fill
                          )
                      ) ,
                    ),
                  ),

                  SizedBox(height: 10,),


                  //texte de bienvenue
                  MyAnimation(
                    duree: 2,
                    child: Text("bienvenue sur ma première application",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  ),

                  SizedBox(height: 10,),





                  //champs adresse Mail

                  MyAnimation(
                    duree: 3,
                    child: TextField(
                      controller: mail,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.mail),
                          hintText: "Entrer votre adresse mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),


                  //champs de mot de passe
                  MyAnimation(
                    duree: 4,
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.lock),
                          hintText: "Entrer votre mot de passe",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),


                  //bouton connexion
                  MyAnimation(
                    duree: 5,
                    child: ElevatedButton(
                      child: Text("Connexion"),
                      onPressed: (){
                        print("Je suis connecté");
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyDashBoard(message: mail.text,)));

                      },
                    ),
                  ),



                  SizedBox(height: 10,),


                  //bouton inscription

                  MyAnimation(
                    duree: 6,
                    child: TextButton(
                      onPressed: (){
                        print("Je suis inscrit");
                        Myfirebasehelper().inscription(email: mail.text, password: password.text);
                       // Navigator.push(context,MaterialPageRoute(builder: (context)=>MyDashBoard(message: mail.text,)));
                      },
                      child: Text("Inscription"),
                    ),
                  )

                ]
            ),
          ),

        )



      /*SingleChildScrollView(


        child:  Column(
        children: [
          Image.asset("lib/images/gto.jpg") ,

           ElevatedButton(
        child: Text("Connexion"),
        onPressed:(){
          print("j'ai appuyé");

        }
      ),

       Container(
        height: 500,
        width:400,
        color: Colors.red,
        child:Text("Salut !")
      )

        ],
        ),
        )





      Image.asset("lib/images/gto.jpg")



      ElevatedButton(
        child: Text("Connexion"),
        onPressed:(){
          print("j'ai appuyé");

        }
      )


      Column(
        children: [
          Text("Salut"),
          Text("Comment tu vas ? "),
          Text("Très bien et toi ?")

        ],
        )

      TextField(
        obscureText:true,
        decoration:InputDecoration(
          border:OutlineInputBorder()
        )
      )

      Container(
        height: 500,
        width:400,
        color: Colors.red,
        child:Text("Salut !")
      )
     Text("Bonjour",style:TextStyle(fontSize:56,fontWeight:FontWeight.bold)) */


    );
  }
}
