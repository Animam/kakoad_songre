import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/google_map.dart';
import 'package:kakoad_songre/screens/home_page.dart';
import 'package:kakoad_songre/screens/sign_in.dart';
import 'package:kakoad_songre/screens/splash.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Signin screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const HomePage());
  }
}


