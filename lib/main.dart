import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:userauth/FireBase/init.dart';
import 'package:userauth/screens/Home.dart';
import 'package:userauth/screens/HomePage.dart';
import 'package:userauth/screens/Otp.dart';
import 'package:userauth/screens/SignIn.dart';
import 'package:userauth/screens/SplashScreen.dart';

import 'FireBase/_Auth.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    return const GetMaterialApp(debugShowCheckedModeBanner: false,


      home:  SplashScreen(),
      // home:  Home(),
    );
  }
}

