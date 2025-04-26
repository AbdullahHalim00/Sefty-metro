import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:collection';
import 'main.dart';
import 'models/repository/user_repository.dart';


void main() {
  runApp(const Mymab());
}

class Mymab extends StatelessWidget {
  const Mymab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myMarkers = HashSet<Marker>();
  late BitmapDescriptor customMarker;
  late BitmapDescriptor locationscustomMarker;
  late GoogleMapController _controller;
  late Marker _marker;

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/icon/iconmap.png',
    );
  }


  getCustomlocationsMarker() async {
    locationscustomMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/icon/—Pngtree—circle clipart green circle_5553151.png',
    );
  }

  @override
  void initState() {
    super.initState();
    getCustomMarker();
    _getCurrentLocation();
    getCustomlocationsMarker();
  }



  _getCurrentLocation() async {
    LocationData? locationData;
    var location = Location();

    try {
      locationData = await location.getLocation();
    } catch (e) {
      print(e);
    }

    if (locationData != null) {
      LatLng currentPosition = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );

      // Create a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get a reference to the Firestore collection where you want to store the location
      CollectionReference locationCollection = firestore.collection('locations');

      // Create a new document in the collection with the current timestamp as the document ID
      DocumentReference locationDocument = locationCollection.doc(uuid);

      // Add the location data to the document
      await locationDocument.set({
        'latitude': currentPosition.latitude,
        'longitude': currentPosition.longitude,
        'timestamp': FieldValue.serverTimestamp(), // Store server timestamp for accuracy
      });

      _addMarker(currentPosition);
    }
  }


  /*
  // Get the user's current location
  _getCurrentLocation() async {
    LocationData? locationData;
    var location = Location();

    try {
      locationData = await location.getLocation();
    } catch (e) {
      print(e);
    }

    if (locationData != null) {
      _addMarker(
        LatLng(locationData.latitude!, locationData.longitude!),
      );
    }
  }
*/
  // Define a function to create a marker at the specified location
  void _addMarker(LatLng location) {
    setState(() {
      _marker = Marker(
        markerId: MarkerId("myLocation"),
        position: location,
        infoWindow: InfoWindow(title: "My Location"),
      );
      myMarkers.add(_marker); // Add the marker to the hash set
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Container(
        child: Stack(
          children: [

            GoogleMap(

              initialCameraPosition: CameraPosition(
                target: LatLng(26.8206, 30.8025),
                zoom: 5,
              ),
              onMapCreated: (GoogleMapController googleMapController){
              setState(() {
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('1'),
                    //30.163645, 31.338380
                    position: LatLng(30.163645, 31.338380),
                    infoWindow: InfoWindow(
                        title: 'New Marg',
                        snippet: 'This is New Marg metro station'),

                    icon: customMarker,
                  ),
                );
               // 30.152077, 31.335675
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('2'),

                    position: LatLng(30.152077, 31.335675),
                    infoWindow: InfoWindow(
                        title: 'Marg',
                        snippet: 'This is Marg metro station'),

                    icon: customMarker,
                  ),
                );
                //30.139313, 31.324415
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('3'),

                    position: LatLng(30.139313, 31.324415),
                    infoWindow: InfoWindow(
                        title: 'Ezbet al-Nakhl',
                        snippet: 'This is Ezbet al-Nakhl metro station'),

                    icon: customMarker,
                  ),
                );
                //30.131026, 31.319056
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('4'),

                    position: LatLng(30.131026, 31.319056),
                    infoWindow: InfoWindow(
                        title: 'Ain Shams',
                        snippet: 'This is Ain Shams metro station'),
                    icon: customMarker,
                  ),
                );
//30.121332, 31.313716
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('5'),

                    position: LatLng(30.121332, 31.313716),
                    infoWindow: InfoWindow(
                        title: 'Matareya',
                        snippet: 'This is Matareya metro station'),
                    icon: customMarker,
                  ),
                );
            //30.113246, 31.313943
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('6'),

                    position: LatLng(30.113246, 31.313943),
                    infoWindow: InfoWindow(
                        title: 'Helmeyet El Zeitoun',
                        snippet: 'This is Helmeyet El Zeitoun metro station'),
                    icon: customMarker,
                  ),
                );
                //30.105881, 31.310468
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('7'),

                    position: LatLng(30.105881, 31.310468),
                    infoWindow: InfoWindow(
                        title: 'Hadayik El Zeitoun',
                        snippet: 'This is Hadayik El Zeitoun metro station'),
                    icon: customMarker,
                  ),
                );
                //30.097643, 31.304554
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('8'),
                    position: LatLng(30.097643, 31.304554),
                    infoWindow: InfoWindow(
                        title: 'Saray El-Qobba',
                        snippet: 'This is Saray El-Qobba metro station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('9'),
                    position: LatLng(30.0911711, 31.2991256),
                    infoWindow: InfoWindow(
                        title: 'Hammamet al-Kobba',
                        snippet: 'This is Hammamet al-Kobba metro station'),
                    icon: customMarker,
                  ),
                );
                //30.087195, 31.294090
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('10'),
                    position: LatLng(30.087195,31.294090),
                    infoWindow: InfoWindow(
                        title: 'Kobri El Koba',
                        snippet: 'This is Kobri El Koba metro station'),
                    icon: customMarker,
                  ),
                );
                //30.081986, 31.287524
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('11'),
                    position: LatLng(30.081986,31.287524),
                    infoWindow: InfoWindow(
                        title: 'Manshiyat al-Sadr',
                        snippet: 'This is Manshiyat al-Sadr metro station'),
                    icon: customMarker,
                  ),
                );
                //30.077318, 31.277259
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('12'),
                    position: LatLng(30.077318,31.277792),
                    infoWindow: InfoWindow(
                        title: 'Al Demerdash',
                        snippet: 'This is Al Demerdash  metro station'),
                    icon: customMarker,
                  ),
                );
                //30.069038, 31.264599
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('13'),
                    position: LatLng(30.069038,31.264599),
                    infoWindow: InfoWindow(
                        title: 'Ghamra',
                        snippet: 'This is Ghamra  metro station'),
                    icon: customMarker,
                  ),
                );
                //30.061071, 31.246040
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('14'),
                    position: LatLng(30.061071,31.246040),
                    infoWindow: InfoWindow(
                        title: 'Al Shuhada',
                        snippet: 'This is Al Shuhada  metro station'),
                    icon: customMarker,
                  ),
                );
                //30.056689, 31.242043
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('15'),
                    position: LatLng(30.056689,31.242043),
                    infoWindow: InfoWindow(
                        title: 'Ahmed Oraby',
                        snippet: 'This is Ahmed Oraby  metro station'),
                    icon: customMarker,
                  ),
                );
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('16'),
                    position: LatLng(30.053499, 31.238722),
                    infoWindow: InfoWindow(
                        title: 'Nasser',
                        snippet: 'This is Nasser Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('17'),
                    position: LatLng(30.044134, 31.234416),
                    infoWindow: InfoWindow(
                        title: 'Sadat',
                        snippet: 'This is Sadat Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('18'),
                    position: LatLng(30.037036, 31.238351),
                    infoWindow: InfoWindow(
                        title: 'Saad Zaghloul',
                        snippet: 'This is Saad Zaghloul Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('19'),
                    position: LatLng(30.029277, 31.235427),
                    infoWindow: InfoWindow(
                        title: 'Sayyeda Zeinab',
                        snippet: 'This is Sayyeda Zeinab Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('20'),
                    position: LatLng(30.017704, 31.231153),
                    infoWindow: InfoWindow(
                        title: 'Al-Malik Al-Saleh',
                        snippet: 'This is Al-Malik Al-Saleh Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('21'),
                    position: LatLng(30.006077, 31.229497),
                    infoWindow: InfoWindow(
                        title: 'Mar Girgis',
                        snippet: 'This is Mar Girgis Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('22'),
                    position: LatLng(29.995425, 31.231040),
                    infoWindow: InfoWindow(
                        title: 'Al-Zahraa',
                        snippet: 'This is Al-Zahraa Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('23'),
                    position: LatLng(29.982134, 31.242252),
                    infoWindow: InfoWindow(
                        title: 'Dar Al-Salam',
                        snippet: 'This is Dar Al-Salam Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('24'),
                    position: LatLng(29.9701104,31.2505834),
                    infoWindow: InfoWindow(
                        title: 'Hadayek Al-Maadi',
                        snippet: 'This is Hadayek Al-Maadi Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('25'),
                    position: LatLng(29.960297, 31.257650),
                    infoWindow: InfoWindow(
                        title: 'Al-Maadi',
                        snippet: 'This is Al-Maadi Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('26'),
                    position: LatLng(29.953296, 31.262948),
                    infoWindow: InfoWindow(
                        title: 'Thakanat Al-Maadi',
                        snippet: 'This is Thakanat Al-Maadi Station'),
                    icon: customMarker,
                  ),
                );

                myMarkers.add(
                  Marker(
                    markerId: MarkerId('27'),
                    position: LatLng(29.946772, 31.272958),
                    infoWindow: InfoWindow(
                        title: 'Tora El-Balad',
                        snippet: 'This is Tora El-Balad Station'),
                    icon: customMarker,
                  ),
                );


                ////locations
                myMarkers.add(
                  Marker(
                    markerId: MarkerId('28'),

                    position: LatLng(30.1559216, 31.3347434),
                    infoWindow: InfoWindow(
                        title: 'car 1',
                        snippet: 'example for location of car'),

                    icon: locationscustomMarker,
                  ),
                );


              });
              },

              markers: myMarkers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),

          ],
        ),
      ),

    );
  }
}
