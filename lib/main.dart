  //s2
//s_login
// import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'afterlogincustomer.dart';

  bool visiblePassword=true;
  var b=Colors.blue;
  var w=Colors.white;
  var r=Colors.red;
  var g=Colors.grey;
  var a=Colors.black87;
  var bu=Colors.white60;
  var BB=Colors.black87;
  var o=Colors.grey;
  //String name ="Abdullah Mostafa Mohamed Abdel Halim";

  double The_money_I_own = 0;
  int ticketshomy00 = 0;
  int total_ticketshomy00 = 0;
  final user= FirebaseAuth.instance.currentUser!;
  final uuid=user.uid;
  String phone ="+201278883609";
  String id= "36598900203989";
  String img_prof="https://www.hotelbooqi.com/wp-content/uploads/2021/12/128-1280406_view-user-icon-png-user-circle-icon-png.png";
  String mode="White Mode";
  String number_of_forgot ="+201278883609";
  final emailController= TextEditingController();
  final passwordController=TextEditingController();

  final emailControllersignup=TextEditingController();
  final passwordControllersignup1=TextEditingController();
  final passwordControllersignup2=TextEditingController();

  var displayName=TextEditingController( );
  final phoneNo=TextEditingController( );
  final ID =TextEditingController();
  final BD= TextEditingController();

  //String uid =user.uid;

  Color am=Colors.amber;
Future main() async
{

  runApp(appy());
}

class appy extends StatefulWidget{
  @override

  appk createState() => appk();

}

class appk extends State<appy>{
  /*
   @override
  State<StatefulWidget> createState() {
    setState(() {
      visiblePassword=!visiblePassword;
    });
  }
   */

void dispose()
{
  emailController.dispose();
  passwordController.dispose();

  super.dispose();

}
  @override
  Widget build(BuildContext context) {



    void sslin(BuildContext ctx)
    {
      Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_){
          return MyApplin();
        },
      ),
      );
    }


    return MaterialApp(
      navigatorKey: navigatorKey,
        debugShowCheckedModeBanner:false ,
        theme: ThemeData(
        primarySwatch: g,
    ),
    home:Scaffold(
    backgroundColor: a,
    body :
         StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot)
          {

            if(snapshot.connectionState==ConnectionState.waiting)
              {
              return Center(child: CircularProgressIndicator(),);
              }
            else if (snapshot.hasError)
              {
                return Center(child: Text('Something went wrong!'),);
              }

            else if(snapshot.hasData)
              {
                return MyApplin();
              }
            else{
              return LoginScreen();
            }

          },
        ),
    ),
    );
  }

}