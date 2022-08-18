import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userauth/screens/Home.dart';
import '../Constants/Dimension.dart';
import 'SplashScreen.dart';
import 'SplashScreen.dart';

String? email;
String? phone;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    print(email);
    print(phone);

    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 3, milliseconds: 500))
      ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 5), () {

          Get.off(Home(), transition: Transition.leftToRightWithFade);

        // else
          // Get.off(OnBoardingScreen(),
          //     transition: Transition.zoom,
          //     duration: Duration(microseconds: 800));
      });
    });
  }

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   controller.dispose();
  // }

  Future getValidationData() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
                scale: animation,
                child: Container(height: D.Hight/4,width: D.Hight100*2,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.identrust.com/sites/default/files/inline-images/secure-authentication%20%281%29_0.png"),fit: BoxFit.fill)),)),
          ],
        ),
      ),
    );
  }
}

