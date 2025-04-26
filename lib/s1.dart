//forgot(find your Account)"1"(searsh and send code)
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saftey_metro/showlogo.dart';
import 'login.dart';
import 's11.dart';
import 'main.dart';

void main() {
  runApp( MyAppf());
}

class MyAppf extends StatelessWidget {
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
  final emailControllerre= TextEditingController();
  void dispose()
  {
    emailControllerre.dispose();

    super.dispose();
  }


  void ss(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return MyApp();
      },
    ),
    );
  }


  void ssfc(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return MyAppfc();
      },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: a,
        drawerScrimColor: g.withOpacity(.3),
        body: Container(
        height: double.infinity,
        color: a,
        child: SingleChildScrollView(

          child: Column(
              children: [

                SizedBox(height: 200),

                Text("Enter your Email",style: TextStyle(fontSize: 25,color: w,),softWrap: true,),
                SizedBox(height: 20),
                SizedBox(
                    height: 2,
                    child: Container(
                      color: Colors.white10,
                    ),
                ),
                SizedBox(height: 50),
                Text("Pleace Enter your Email to get your Link To get your Account",style: TextStyle(fontSize: 25,color: g,inherit: true),softWrap: true,
                ),
                SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(8),
            child: TextFormField(

              controller: emailControllerre,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: g),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  labelText: "email",
                  labelStyle:TextStyle(
                    fontSize: 30,
                    color: g,
                  ) ,
                  hintText: "Enter email",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: w,
                  ),
              ),
              style: TextStyle(color: w),
              keyboardType: TextInputType.emailAddress,

            ),
          ),
                SizedBox(height: 50),
                SizedBox(
                  height: 2,
                  child: Container(
                    color: Colors.white10,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(

                  onPressed: (){


                      try{
                         FirebaseAuth.instance
                            .sendPasswordResetEmail(email: emailControllerre.text.trim());
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                          content: Container(
                            padding: EdgeInsets.all(16),
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(child: Text("We send The link for ${emailControllerre.text}",),),
                          ),
                             behavior: SnackBarBehavior.floating,
                             backgroundColor: Colors.transparent,
                             elevation: 0,
                         ),
                         );
                      } on FirebaseException catch (e)
                      {
                        print(e);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                              padding: EdgeInsets.all(16),
                              height: 90,
                              decoration: BoxDecoration(
                                color: r,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Text("${e.message}"),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      }


                     // ssfc(context);

                  },
                  style:ButtonStyle(

                    padding:MaterialStateProperty.all (EdgeInsets.fromLTRB(100,10,100,10),),
                    backgroundColor: MaterialStateProperty.all(o),
                    elevation: MaterialStateProperty.all(5),
                  ) ,
                  // color:Colors.lightBlue,

                  // padding: EdgeInsets.fromLTRB(150, 15, 150,15 ),
                  child:
                  Text(
                    "Reset Password",
                    style:TextStyle(
                      fontSize: 15,color: w,
                    ),
                  ),
                ),
                SizedBox(width: 10),

              ]),
        ),
      ),


      );


  }
}
