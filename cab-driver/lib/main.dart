import 'package:cabdriver/dataprovider.dart';
import 'package:cabdriver/globalvariabels.dart';
import 'package:cabdriver/screens/login.dart';
import 'package:cabdriver/screens/mainpage.dart';
import 'package:cabdriver/screens/registration.dart';
import 'package:cabdriver/screens/vehicleinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
            googleAppID: '1:169450788828:ios:565f2d4b4623a7dbf9a119',
            gcmSenderID: '169450788828',
            databaseURL: 'https://geetaxi-9c60a.firebaseio.com',
          )
        : const FirebaseOptions(
            googleAppID: '1:371478357520:android:77d2ba78f4b69eda870c95',
            apiKey: 'AIzaSyD7gg8RqlEXfqYveCz1oo1s17izaxCGq90',
            databaseURL: 'https://moveride-abaeb-default-rtdb.firebaseio.com',
          ),
  );

  currentFirebaseUser = await FirebaseAuth.instance.currentUser();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute:
            (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
        routes: {
          MainPage.id: (context) => MainPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          VehicleInfoPage.id: (context) => VehicleInfoPage(),
          LoginPage.id: (context) => LoginPage(),
        },
      ),
    );
  }
}
