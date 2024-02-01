import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/style.dart';
import 'package:project_iot/page/addM.dart';
import 'package:project_iot/page/alerts_page.dart';
import 'package:project_iot/page/editHistory.dart';
import 'package:project_iot/page/historyNetwork.dart';
import 'package:project_iot/page/login_page.dart';
import 'package:project_iot/page/medical_hist_page.dart';
import 'package:project_iot/page/network_page.dart';
import 'package:project_iot/page/splash_Page.dart';
import 'package:project_iot/page/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAK9d2wngMct5-MCIEpdZD0lI2fkRJH9pI",
      appId: "1:337160324458:android:6f3873e3a949e7a8b0d113",
      messagingSenderId: "337160324458",
      projectId: "myfirstproject-8790a",
    ),);

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('------------User is currently signed out!-------------');
      } else {
        print('-----------------User is signed in!-------------------');
        print('UID: ${user.uid}');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? LoginPage() : HomePage(),
      routes: {
        "home" : (context) => Home(),
        "history":(context) => MedicalHist(),
        "network":(context) => Network(),
        "alerts":(context) => CoronaNotificationsPage(),
        "addM":(context) => AddM(),
        "editHist":(context) => EditHistory(),
        "historyNetwork":(context) => HistoryNetwork(),
      },
    );
  }
}