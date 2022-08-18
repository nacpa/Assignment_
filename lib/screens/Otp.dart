import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:userauth/CustomWidget/CustomSnackBar.dart';
import 'package:userauth/CustomWidget/CustomText.dart';
import 'package:userauth/screens/SignIn.dart';
import 'package:userauth/screens/SignUp.dart';

import '../Constants/Dimension.dart';
import '../Constants/constants.dart';
import '../CustomWidget/CustomButton.dart';
import 'Home.dart';
import 'HomePage.dart';

class OTp extends StatefulWidget  {
   OTp({Key? key,required this.verificationId}) : super(key: key);
  String verificationId ;

  @override
  State<OTp> createState() => _OTpState();
}

class _OTpState extends State<OTp>with TickerProviderStateMixin {
  bool resend=false;


  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void change(){
    resend=true;
  }
  @override
  Widget build(BuildContext context) {

    // Timer(Duration(seconds: 59), () async {
    //
    //   Snack("Time Limit Exceed", "", Colors.redAccent, Colors.white);
    //   Get.off(Home(), transition: Transition.leftToRightWithFade);});

    final _auth=FirebaseAuth.instance;
    TextEditingController _controller=TextEditingController();



    final defaultPinTheme = PinTheme(
      width: D.Hight30*2,
      height: D.Hight30*1.8,
      textStyle: TextStyle(fontSize: D.Hight20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(D.Hight30),
                child: Material(color: Colors.transparent,
                  child: InkWell(onTap: (){
                    Get.back();
                  },
                    child: Container(height: D.Hight30*1.4,width: D.Hight30*1.4,margin: EdgeInsets.all(D.Hight10/2),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [BoxShadow(offset: Offset(-4,4),blurRadius: 2,spreadRadius: -1,color: Colors.grey.shade300)],
                          shape: BoxShape.circle,color: g1),child: Icon(Icons.arrow_back,size: D.Hight30,),),
                  ),
                ),
              ),
            SizedBox(height: D.Hight100,),
              Padding(
                padding:  EdgeInsets.only(left: D.Hight20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CustomText("", txt: "Enter OTP", txtSize: D.Hight30, clr: Colors.black, bold: false),
                  SizedBox(height: D.Hight20,),
                  CustomText("", txt: "an six Digit Code has been sent to ", txtSize: D.Hight10*1.5, clr: Colors.black87, bold: false),
                    SizedBox(height: D.Hight10/2,),

                    Row(children: [
                      CustomText("", txt: "Incorrect Number? ", txtSize: D.Hight10*1.5, clr: Colors.black87, bold: false),
                      CustomText("", txt: "Change ", txtSize: D.Hight10*2, clr: g1, bold: false),

                    ],)
                ],),
              ),

              SizedBox(height: D.Hight20,),
              Container(margin: EdgeInsets.symmetric(horizontal: D.Hight20,vertical: D.Hight10),
                  height: D.Hight30*2,width: double.maxFinite,
                  child: Pinput(length: 6,defaultPinTheme: defaultPinTheme,controller: _controller,)),


              GestureDetector(onTap: () async {
                print(_controller.text);
                PhoneAuthCredential cred= await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: _controller.text);
                UserCredential _user= await _auth.signInWithCredential(cred).catchError((e){
                  print(e.toString());
                  Snack("Faild", "OTP Verification failed", Colors.red, Colors.white);
                  Get.off(Home());
                }) ;
                if(_user.additionalUserInfo!.isNewUser){
                Snack("SignUp Sucessfully", "", g1, Colors.black);
                await Get.off(HomePage());



                }else{
                  Snack("Welcome Back", "", g1, Colors.black);
                  await Get.off(HomePage());
                };


              },
                  child: Center(child: CustomButton(txt: 'Done       ', clr: g1, iconData: Icons.add, iconclr: g1, txtColor: Colors.black,))),
              SizedBox(height: D.Hight20,),

              if(!resend)
              Center(child: CustomText("", txt: "Resend  OTP in ", txtSize: D.Hight20/1.3, clr: Colors.black, bold: false)),
              SizedBox(height: D.Hight30,),
              if(!resend)
              Center(child: CircularCountDownTimer(onComplete: (){
                // Snack("Time Limit Exceed", "", Colors.redAccent, Colors.white);
                setState((){
                  change();
                  print("123456789");
                });
                  // Get.off(Home(), transition: Transition.leftToRightWithFade);
              },
                width: D.Hight100, height: D.Hight100, duration: 59, fillColor: g1, ringColor: g2,isReverse: true,)),
              if(resend)
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Center(child: CustomText("", txt: "Dont you recieve any Code ? ", txtSize: D.Hight10*1.6, clr: Colors.black, bold: false),),
                  Center(child: CustomText("", txt: "Resend", txtSize: D.Hight20*1.4, clr: g1, bold: true
                  ),),
                ],)

            ],),
        ),
      ),
    );
  }
}
