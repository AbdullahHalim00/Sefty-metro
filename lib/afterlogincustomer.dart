//s1
//s_pages
import 'dart:io';
import 'dart:ui';
import 'map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:saftey_metro/main.dart';
import 'homy.dart';
import 'main.dart';
import 'login.dart';
import 'models/repository/user_repository.dart';
//import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

String? dataNamehome="";
String? datamymhome="";
String? total_ticketshomy="0";
String? ticketshomy="0";
int? ticket=int.parse(ticketshomy!) ;
int? total_tickit=int.parse(total_ticketshomy!) ;
/*
String _uid =user.uid;
 final datafe = FirebaseFirestore.instance.collection("User's data").doc("WnP1mqsLDVEGP4DHmayu").get() ;


String displayNamefe= datafe.get('Name');
late String phoneNofe= datafe.get('phoneNo');
late String IDfe = datafe.get('ID');
late String BDfe=datafe.get('BD');
late String mymfe=datafe.get('My Money');
*/
Future main() async{
  runApp( MyApplin());
}

class MyApplin extends StatelessWidget {

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(

        primarySwatch:  g,
      ),
      home:  MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {






void th()
{
  FirebaseAuth.instance.signOut();
  setState(() {

    if(a==Colors.black87){
      a=Colors.white;
      w=Colors.black87;
      b=Colors.blueGrey;
      o=Colors.blueGrey;
      g=Colors.blueGrey;
      mode="Dark Mode";
    }
    else if( a==Colors.white)
    {
      a=Colors.black87;
      w=Colors.white;
      b=Colors.grey;
      o=Colors.grey;
      g=Colors.grey;

      mode="Light Mode";
    }

  });



}
  void ss00(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(
                  "assets/icon/227264-134f96a2-39a8-4599-9c5d-57ac91a1349b.jpg",fit: BoxFit.fill,height: 1000,
                )
              ],

            ),
          ),
        );
      },
    ),
    );
  }

  void ss(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return appy();

      },
    ),
    );
  }

  List <Map<String,Object>> _pages= [
    //Home
    {

      'page':homy(),

      //appyrs1(),

      'title':"Home",
    },

//Metro map
    {
      'page':  Mymab(),
      'title':"Metro map",
    },
    //prof
    {
      'page': const profile(),
      'title':"My Profile",
    },
  ];
  int _spi=0;
  void _x1(int index)
  {
    setState(() {
      _spi=index;
    });
  }
/*

  Widget info(String A,Color color)
  {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        A,style:
      TextStyle(
        fontSize: 30,
      ),

      ),
      decoration: BoxDecoration(gradient: LinearGradient(
        colors: [
          color.withOpacity(.7),
          color,
        ],
        begin: Alignment.topLeft,
        end:Alignment.bottomRight ,
      ),
          borderRadius: BorderRadius.circular(30) ),
    );
  }

 */

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawerScrimColor: g.withOpacity(.3),

        appBar: AppBar(
          backgroundColor: g,
          /*
        bottom: TabBar(
          tabs:<Widget> [
          Tab(
          icon: Icon(Icons.account_box),
            text: ("login"),
          ),
            Tab(
              icon: Icon(Icons.account_box_outlined),
              text: ("create Acount"),
            ),
          ],
        ),
        */

          title: Text(_pages[_spi]['title'].toString()),
        ),

        body: _pages[_spi]['page'] as Widget,

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: am,
          selectedItemColor: w,
          unselectedItemColor: a,
          type: BottomNavigationBarType.shifting,
          currentIndex: _spi,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          iconSize: 30,
          onTap: _x1,
          items: [

            BottomNavigationBarItem(
                backgroundColor: g,
                icon: Icon(Icons.home_outlined), label: 'Home'

            ),


            BottomNavigationBarItem(
                backgroundColor: g,
                icon: Icon(Icons.map_outlined),label: 'Metro map'
              //title:Text ("create Acount"),
            ),

            BottomNavigationBarItem(
                backgroundColor: g,
                icon: Icon(Icons.person_outline_rounded),label: 'Your Profile'

            ),
          ],
        ),

        /*
        TabBarView(
          children:<Widget> [
            appy(),
            appyr(),

          ],
        ),
*/
        drawer: Drawer(
          backgroundColor: g.withOpacity(.9),
            child:ListView(
              children: [
                //mode
                ListTile(

                  title: Text(mode,style: TextStyle(fontSize: 30)),
                  subtitle: Text("Get Look For $mode ,Will Sign Out"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: th

                ),

               // Metro map
                ListTile(

                  title: Text("Metro Map",style: TextStyle(fontSize: 30)),
                  subtitle: Text("Get Look"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () => ss00(context),
                ),

                ListTile(

                  title: Text("Log Out",style: TextStyle(fontSize: 30)),
                  subtitle: Text("Log Out,From Email"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () => FirebaseAuth.instance.signOut(),
                ),
              ],

            )


        ),

/*
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        */// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );

  }

}
