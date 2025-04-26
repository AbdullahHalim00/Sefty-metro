//forgot(enteration code)"2"


import 'package:flutter/material.dart';
import 'package:saftey_metro/showlogo.dart';
import 'main.dart';

void main() {
  runApp( MyAppfc());
}

class MyAppfc extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(

        primarySwatch: g,
      ),
      home:  MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key, required this.title});


  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void ss(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return MyApp();
      },
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(
        backgroundColor: a,
        drawerScrimColor: g.withOpacity(.3),
        body: Container(
          height: double.infinity,
          color: a,
          child: SingleChildScrollView(

            child: Column(
                children: [

                  SizedBox(height: 100),

                  Text("Enter security code",style: TextStyle(fontSize: 25,color: w,),softWrap: true,),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 2,
                    child: Container(
                      color: Colors.white10,
                    ),
                  ),
                  SizedBox(height: 100),
                  Text("Pleace check you phone for a text message with your code.",style: TextStyle(fontSize: 25,color: g,inherit: true),softWrap: true,
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: g),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        labelText: "Enter code",
                        labelStyle:TextStyle(
                          fontSize: 30,
                          color: g,
                        ) ,
                        hintText: "Enter code",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: w,
                        ),

                      ),
                      style: TextStyle(color: w),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    child: Text("We sent your code to: ${number_of_forgot}",style: TextStyle(fontSize: 20,color: g,inherit: true),softWrap: true,
                  ),
          ),
                  SizedBox(height: 150),
                  SizedBox(
                    height: 2,
                    child: Container(
                      color: Colors.white10,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(

                        onPressed: (){

                        },
                        style:ButtonStyle(
                          padding:MaterialStateProperty.all (EdgeInsets.fromLTRB(15,15,15,15),),
                          backgroundColor: MaterialStateProperty.all(o),
                          elevation: MaterialStateProperty.all(5),
                        ) ,
                        // color:Colors.lightBlue,

                        // padding: EdgeInsets.fromLTRB(150, 15, 150,15 ),
                        child: Text(
                          "Continue",
                          style:TextStyle(
                            fontSize: 15,color: w,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(

                        onPressed: (){
                          setState(() {
                            ss(context);
                          });
                        },
                        style:ButtonStyle(
                          padding:MaterialStateProperty.all (EdgeInsets.fromLTRB(15,15,15,15),),
                          backgroundColor: MaterialStateProperty.all(w),
                          elevation: MaterialStateProperty.all(5),
                        ) ,
                        // color:Colors.lightBlue,

                        // padding: EdgeInsets.fromLTRB(150, 15, 150,15 ),
                        child:
                        Text(
                          "Cancel",
                          style:TextStyle(
                            fontSize: 15,color: a,
                          ),
                        ),
                      ),
                    ],
                  ),

                ]),
          ),
        ),


      );


  }
}
