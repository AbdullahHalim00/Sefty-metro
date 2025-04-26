//s3
//s_creat ac
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'afterlogincustomer.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';



void main() {
  runApp(appyr());
}
class appyr extends StatefulWidget{
  @override
  appk createState() => appk();

}
class appk extends State<appyr> {

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async{
    final result= await FilePicker.platform.pickFiles();
    if(result==null) return;

    setState(() {
      pickedFile = result.files.first;
    });

  }
  void data() async{
    final imageURL = await saveImageAndGetURL();
    Map <String,String>creatUser={
      'ImageName':imageURL,
      'Name':displayName.text,
      'ID':ID.text,
      'phoneNo':phoneNo.text,
      'BD':BD.text,
      'My Money':The_money_I_own.toString(),
      'E-mail':emailControllersignup.text,
      'total tickets':ticketshomy00.toString(),
      'My ticket' : total_ticketshomy00.toString(),
    };


    ///Reference to document
    final data=FirebaseFirestore.instance.collection("User's data").doc(uuid).set(creatUser);
  }

  Future<String> saveImageAndGetURL() async {

    final path = 'Images/${uuid}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    // Wait for the upload task to complete and get the snapshot
    final snapshot = await uploadTask.whenComplete(() {});

    // Get the download URL of the uploaded image
    final downloadURL = await snapshot.ref.getDownloadURL();

    // Return the download URL as a string
    return downloadURL.toString();
  }



  //خاص بالفاير استور


  final formKey =GlobalKey<FormState>();

  //final VoidCallback showRegisterPage;
  Color bg=Colors.grey;
  bool visiblePassword = true;
  bool visiblePassword2 = true;
  void sslogin(BuildContext ctx)
  {
    Navigator.of(ctx).pop(MaterialPageRoute(
      builder: (c){
        return MyApplin();
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: a,
          centerTitle: true,
          title: Text("Create An Account",style: TextStyle(color: w)),
        ),
        body:Container(
          child: SingleChildScrollView(
            child: Column(
                children:<Widget>[
                  SizedBox(height: 20,),
                  if(pickedFile ==null)
                    Center(
                      child: Image(
                        image: NetworkImage(img_prof),
                        fit: BoxFit.fill,
                        //color: w,
                        height: 150,) ,
                    ),

                  if(pickedFile !=null)
                    Center(
                      child: Image.file(
                          File(pickedFile!.path!),
                          fit: BoxFit.fill,
                          height: 150) ,
                    ),
                  InkWell(
                    onTap: selectFile,
                    child:Icon(Icons.camera_alt_outlined,color: g,),
                  ),


                  Container(

                    margin: EdgeInsets.all(8),
                    child: TextField(

                      controller: displayName,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Enter Full of Your Name",
                        icon: Icon(Icons.person,color: bg),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      controller: ID,
                      decoration: InputDecoration(
                        labelText: "ID",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Enter National ID",
                        icon: Icon(Icons.person_pin_outlined,color: bg),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      controller: emailControllersignup,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Enter E-mail",
                        icon: Icon(Icons.email_outlined,color: bg),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                    controller: passwordControllersignup1,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Enter Password",
                        //  icon: Icon(Icons.visibility_off_outlined),
                        icon: Icon(Icons.lock_open_outlined,
                            color: bg
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visiblePassword?Icons.visibility:Icons.visibility_off_outlined,
                              color: g
                          ),
                          onPressed:(){
                            setState(() {
                            visiblePassword=!visiblePassword;
                          });},// createState,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visiblePassword,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextFormField(
                      controller:passwordControllersignup2 ,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Confirm Password",
                        //  icon: Icon(Icons.visibility_off_outlined),
                        icon: Icon(Icons.lock_open_outlined,
                            color: bg
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            visiblePassword2?Icons.visibility:Icons.visibility_off_outlined,
                              color: g
                          ),
                          onPressed:(){
                            setState(() {
                              visiblePassword2=!visiblePassword2;
                            });},// createState,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visiblePassword2,

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      controller: phoneNo,
                      decoration: InputDecoration(
                        prefixText: "+20  ",
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 30,color: bg),
                        hintText: "Enter Phone Number",
                        prefixIcon: Icon(Icons.phone,
                          color: bg,),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      controller: BD,
                      decoration: InputDecoration(
                        labelText: "Birth Day",
                        labelStyle: TextStyle(
                          fontSize: 30,
                            color: bg
                        ),
                        hintText: "Enter your Birth Day",
                        icon: Icon(Icons.date_range_outlined,
                            color: bg
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 20,
                  ),
                  ElevatedButton(
                    child: Text("Sign Up",
                      style:TextStyle(
                        fontSize: 15,color: w,
                      )),
                      onPressed: ()
                      {
                        if (passwordControllersignup1.text == passwordControllersignup2.text)
                          {
                            var user1=FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: emailControllersignup.text,
                                password: passwordControllersignup2.text
                            ).then((value) async {
                              print("Created New Account");

                              data();
                              //img save in firebase
                              saveImageAndGetURL();


                              sslogin(context);
                            }).onError((error, stackTrace) {
                              print("Error is ${error.toString()}");
                            });

                          }
                          else if(passwordControllersignup1.text != passwordControllersignup2.text)
                            {
                              print("The two secret values do not match!");
                            }


                      },
                    style:ButtonStyle(
                      padding:MaterialStateProperty.all (EdgeInsets.fromLTRB(145,14.5,145,14.5),),
                      backgroundColor: MaterialStateProperty.all(o),
                      elevation: MaterialStateProperty.all(0),
                    ),

                  ),

                  SizedBox(height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I am a member!",style: TextStyle(fontSize: 20,color: Colors.black,)),

                      InkWell(
                        child: Text(" Sign In",style: TextStyle(fontSize: 20,color: g,)),
                        onTap: () => sslogin(context),

                      ),
                    ],
                  ),

                  SizedBox(height: 50,
                  ),
                ]
            ),
          ),
        ),
      ),








    );

  }
}
/*
@override
  State<StatefulWidget> createState() {

    setState(() {
      visiblePassword=!visiblePassword;
    });

  }
 */

//}
