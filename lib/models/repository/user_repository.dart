//profile p
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saftey_metro/modules/register/register_screen.dart';

import '../../afterlogincustomer.dart';
import '../../login.dart';
import '../../main.dart';
String? dataName="";
String? dataID="";
String? dataphoneNofe="";
String? dataBDfe="";
String? datamym="";
String? dataE_mail="";
String? dataimagey="";
void main()
{
  runApp(profile());
}
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  void RegisterScreeny(BuildContext ctx)
  {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return MyAppRegisterScreenn();
      },
    ),
    );
  }

  @override
  void initState()
  {
    super.initState();
    getUserInfo();
  }
  Future<void> getUserInfo() async {
    FirebaseFirestore.instance.collection("User's data").doc(uuid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // get the data map from the document
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> dataid = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> dataEmail = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> dataphone = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> dataBD = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> datamymoney = documentSnapshot.data() as Map<String, dynamic>;

        Map<String, dynamic> dataimage = documentSnapshot.data() as Map<String, dynamic>;
        // get the name field from the data map
        //String name = data['Name'];
        String fullNamefe=data['Name'];
        String IDfe=dataid['ID'];
        String phoneNofe=dataphone['phoneNo'];
        String BDfe=dataBD['BD'];
        String mym=datamymoney['My Money'];
        String E_mail=dataEmail['E-mail'];

        String Image=dataimage['ImageName'];
        setState(() {
          dataName = fullNamefe;
          dataID = IDfe;
          dataphoneNofe=phoneNofe;
          dataBDfe= BDfe;
          datamym=mym ;
          dataE_mail=E_mail;
          dataimagey=Image;
        });
      } else {
        print('Document does not exist on the database');
      }
    }).catchError((error) => print('Error retrieving document: $error'));
  }



  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile_and_save() async{

    final result= await FilePicker.platform.pickFiles();
    if(result==null) return;

    setState(() {
      pickedFile = result.files.first;
    });
    final path ='Images/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: g,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body:
    /*

        Container(
          height: double.infinity,
          color: a,
          child:SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: 50),
                if(pickedFile ==null )
                  Center(
                    child: dataimagey == null ||dataimagey==""
                        ? CircularProgressIndicator()
                        : ClipOval(
                      child: Image.network(
                        dataimagey!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                      ),
                    ),
                  ),



                if(pickedFile !=null)
                 Center(
                 child: pickedFile!.path! == null
                  ? CircularProgressIndicator()
                   : ClipOval(
                child: Image.file(
                File(pickedFile!.path!),
                fit: BoxFit.cover,
                height: 150,
                width: 150,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                ) ,
                ),
                 ),
                /*
                InkWell(
                  onTap: selectFile_and_save,
                  child:Icon(Icons.camera_alt_outlined,color: g,),
                ),
*/
                SizedBox(height: 50),

                Column(
                  children: [
                    Text("Name: ${dataName}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text("E-mail: ${dataE_mail}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text("Phone: +20${dataphoneNofe}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text("ID: ${dataID}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text("My money: ${datamym}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text("Birthday: ${dataBDfe}",style: TextStyle(fontSize: 20,color: w,),softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 25,),

              ],

            ),

          ),

        ),

     */

        Container(
          height: double.infinity,
          color: a,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                if (pickedFile == null)
                  Center(
                    child: dataimagey == null || dataimagey == ""
                        ? CircularProgressIndicator()
                        : ClipOval(
                      child: Image.network(
                        dataimagey!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                if (pickedFile != null)
                  Center(
                    child: pickedFile!.path! == null
                        ? CircularProgressIndicator()
                        : ClipOval(
                      child: Image.file(
                        File(pickedFile!.path!),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.person, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${dataName}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.email, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${dataE_mail}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.phone, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "+20${dataphoneNofe}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.credit_card, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${dataID}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.attach_money, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${datamym}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5), // تغيير المسافة هنا
                    CircleAvatar(
                      child: Icon(Icons.cake, size: 30),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${dataBDfe}",
                        style: TextStyle(fontSize: 20, color: w),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),







        floatingActionButton: FloatingActionButton.extended(

          onPressed: (){
            setState(() {
              RegisterScreeny(context);
            });


          },
          tooltip: 'Recharge the balance',

           label: Text("Recharge the balance"),
            icon:const Icon(Icons.attach_money_outlined),
        ),
      ),
    );

  }
}
