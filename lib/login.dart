import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saftey_metro/main.dart';
import 'afterlogincustomer.dart';
import 's2.dart';
import 's1.dart';



//UserModel authController=Get.find<UserModel>();


 //String displayNamefe;
 //String phoneNofe="";
 //String IDfe ="";
 //String BDfe="";
 //String mymfe="";
/*

DocumentSnapshot datafe =  FirebaseFirestore
    .instance.collection("User's data").doc(_uid).get() as DocumentSnapshot<Object?> ;
String displayNamefe = datafe.get('Name');
String phoneNofe = datafe.get('phoneNo');
String IDfe = datafe.get('ID');
String BDfe = datafe.get('BD');
String mymfe = datafe.get('My Money');

 */


final navigatorKey =GlobalKey<NavigatorState>();
void main()
{
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();



}


class _LoginScreenState extends State<LoginScreen> {


//fetch data for profile user


  Future signIn() async {
/*
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
    );
    navigatorKey.currentState!.popUntil((context) => context.isFirst);

 */
    try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:emailController.text.trim(),
        password: passwordController.text.trim(),

      );
    } on FirebaseException catch (e)
    {
      print(e);
    }


  }


  void ssf(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return MyAppf();
      },
    ),
    );
  }


  void ss(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return appyr();
      },
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: g,
      ),


      home: Container(
        color: a,
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 100,),
              Center(

                  child:Image.asset(
                    "assets/icon/icon.png",fit: BoxFit.scaleDown,width: 170,height: 170,
                  )

              ),
              SizedBox(height: 25,),
              Container(
                margin: EdgeInsets.all(8),
                child: TextField(
                  textInputAction:TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: g),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: "Email",
                      labelStyle:TextStyle(
                        fontSize: 30,
                        color: g,
                      ) ,
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: w,
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: o,
                      )
                  ),
                  style: TextStyle(color: w),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: TextField(
                  controller: passwordController,
                  textInputAction:TextInputAction.done,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: g),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 30,
                      color: g,
                    ),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: w,
                    ),
                    //  icon: Icon(Icons.visibility_off_outlined),
                    prefixIcon: Icon(Icons.lock_open_outlined,
                      color: o,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        visiblePassword?Icons.visibility_outlined:Icons.visibility_off_outlined,
                        color: o,
                      ),
                      onPressed: (){
                        setState(() {
                          visiblePassword=!visiblePassword;
                        });},//createState,
                    ),
                  ),
                  style: TextStyle(color: w ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: visiblePassword,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:(){
                      setState(() {
                        ssf(context);
                      });
                    } ,
                    child:const Text("Forgot Password?") ,
                  ),
                ],
              ),

              SizedBox(height: 10,),
              ElevatedButton(

                onPressed:(){
                 // getUserInfo();
                  /*
                void getData() async {
                  String _uid = user.uid;
                  DocumentSnapshot datafe = await FirebaseFirestore
                      .instance.collection("User's data").doc(_uid).get();


                  displayNamefe = datafe.get('Name');
                  phoneNofe = datafe.get('phoneNo');
                  IDfe = datafe.get('ID');
                  BDfe = datafe.get('BD');
                  mymfe = datafe.get('My Money');
                };

                   */
                  signIn();

                },

                /*
                      (){
                    setState(() {
                      sslin(context);
                    });
                  },
                    */

                style:ButtonStyle(
                  padding:MaterialStateProperty.all (EdgeInsets.fromLTRB(150,15,150,15),),
                  backgroundColor: MaterialStateProperty.all(o),
                  elevation: MaterialStateProperty.all(0),
                ) ,
                // color:Colors.lightBlue,

                // padding: EdgeInsets.fromLTRB(150, 15, 150,15 ),
                child:
                Text(
                  "Sign In",
                  style:TextStyle(
                    fontSize: 15,color: w,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Not a member?",style: TextStyle(color: w,fontSize: 15,decorationColor: a)),
                  TextButton
                    (
                    onPressed: (){
                      setState(() {
                        ss(context);
                      });
                    },
                    /*
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all(g),
                  elevation: MaterialStateProperty.all(10),
                  padding: MaterialStateProperty.all( EdgeInsets.fromLTRB(10, 10, 10,10 ),

                  ),
                ),
*/
//00

                    child: Text(
                      "Sign Up",
                      style:TextStyle(
                        fontSize: 15, color: g,
                      ),
                    ),
                  ),
                ],
              ),
               
              SizedBox(height: 20,),

            ],
          ),

        ),
      ),

    );
  }

}
