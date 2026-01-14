import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newpro/mobile/landing_page_mobile.dart';
import 'package:newpro/web/landing_page_web.dart';
import 'package:newpro/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCqq_5rdRfvHg7292nYNeyqJtRFqySfdk0",
          authDomain: "portfolio-40e2a.firebaseapp.com",
          projectId: "portfolio-40e2a",
          storageBucket: "portfolio-40e2a.firebasestorage.app",
          messagingSenderId: "495568473230",
          appId: "1:495568473230:web:808424e972c002e70b8ddf",
          measurementId: "G-EVFXSD766M"
      )
    );
  }
  else{
    await Firebase.initializeApp();
  }
  setPathUrlStrategy();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: (settings) => Routes.generateRoute(settings),
     initialRoute: '/',
   );
  }
}
