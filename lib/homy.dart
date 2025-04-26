import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:saftey_metro/main.dart';
import 'afterlogincustomer.dart';

import 'package:dio/dio.dart';

import 'models/repository/user_repository.dart';

void main() {
  runApp(const homy());
}

class homy extends StatelessWidget {
  const homy({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(

        primarySwatch: g,
      ),
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {

  @override
  State<MyHomePage1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  bool _hasNfc = false;
  @override
  void initState()
  {
    super.initState();
    NfcManager.instance.isAvailable().then((available) {
      setState(() {
        _hasNfc = available;
      });
    });
    getUser_name_money();
  }

  Future<void> getUser_name_money() async {

    FirebaseFirestore.instance.collection("User's data").doc(uuid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // get the data map from the document
        Map<String, dynamic> dataname = documentSnapshot.data() as Map<String, dynamic>;

        Map<String, dynamic> datamymoneyhome = documentSnapshot.data() as Map<String, dynamic>;

        Map<String, dynamic> datamyticketshome = documentSnapshot.data() as Map<String, dynamic>;

        Map<String, dynamic> datatotal_ticketshomy = documentSnapshot.data() as Map<String, dynamic>;
        // get the name field from the data map
        //String name = data['Name'];
        String fullNamefehome=dataname['Name'];
        String mymhome=datamymoneyhome['My Money'];
        String dataticketshome=datamyticketshome['My ticket'];
        String total_ticketshomy0=datatotal_ticketshomy['total tickets'];
        setState(() {
          dataNamehome = fullNamefehome;
          datamymhome=mymhome ;
          ticketshomy=dataticketshome ;
          total_ticketshomy =total_ticketshomy0 ;
          ticket=int.parse(ticketshomy!) ;
          total_tickit=int.parse(total_ticketshomy!) ;
        });
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) => print('Error retrieving document: $error'));
  }


  //// NFC
  ValueNotifier<dynamic> result = ValueNotifier('08 ED 09 10');
  late Timer _timer;


  bool _buttonEnabled = true;
  void _startTimer() {
    _timer = Timer(Duration(seconds: 10), () {
      setState(() {
        _buttonEnabled = true;
      });
    });
  }


  void updateUsertickets() async {

    // استخدام معرف المستخدم كاسم للمستند
    final user = FirebaseAuth.instance.currentUser;
    final userDataRef = FirebaseFirestore.instance.collection("User's data").doc(user!.uid);

    // جلب البيانات الحالية
    final snapshot = await userDataRef.get();
    final data = snapshot.data() ?? {};

    // تحديث قيمة "My Money"
    final currentMoney = int.tryParse(data['My ticket'] ?? '0') ?? 0;
    final newMoney = currentMoney -1;
    final updatedData = {...data, 'My ticket': newMoney.toString()};

    // إضافة البيانات إلى المستند
    await userDataRef.set(updatedData);
    print("the tickets-1");

  }
/////
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Container(

          height: double.infinity,
          color: a,
          child: SingleChildScrollView(

            child: Column(

              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Welcome,",style: TextStyle(color: g,fontSize: 30)),
                  ],

                ),

                Text("${dataNamehome}",style: TextStyle(color: w,)),
                SizedBox(height: 50),
                Row(
                  children: [
                    Text("The money I own",style: TextStyle(color: w,)),
                  ],
                ),

                Center
                  (

                  child: Text("${datamymhome}",style: TextStyle(color: w,fontSize: 50)),
                ),
                Column(

                  children: [
                    SizedBox(height: 2,child: Container(color: a,)),
                  ],
                ),
                SizedBox(height: 70),
                Row(
                  children: [
                    Text("The tickets",style: TextStyle(color: w,)),
                  ],
                ),

                Container(
                  //color: a,
                  child: CircularPercentIndicator(
                    //fillColor: a,
                    animation: true,
                    animationDuration: 10000,
                    radius: 100,
                    lineWidth: 10,
                    percent: (ticket! *1)/total_tickit!,
                    progressColor: g,
                    footer: Text("${ticketshomy} "
                        " From ${total_ticketshomy} Tickets",style: TextStyle(color: w,fontSize: 30)),
                    rotateLinearGradient: true,
                    restartAnimation: true,
                    addAutomaticKeepAlive: true,
                    reverse: true,
                    backgroundColor: w,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
            SizedBox(height: 10,),
            /*
            _hasNfc &&
                ticket! > 0
                ? ElevatedButton(
              onPressed: _buttonEnabled
                  ? () {
                setState(() {
                  _buttonEnabled = false;
                });
                updateUsertickets();
                _startTimer();
              }
                  : null,
              child: Text('open the gate'),
            )
                : Center(
                  child: Text('NFC not available on this device Or this account does not contain tickets',
                  style: TextStyle(
                    color: r,
                  )),
                ),


*/
              ],

            ),

          ),
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
