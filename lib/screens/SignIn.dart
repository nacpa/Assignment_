import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userauth/CustomWidget/CustomButton.dart';
import 'package:userauth/CustomWidget/CustomText.dart';
import 'package:userauth/CustomWidget/PhoneNo.dart';
import 'package:userauth/screens/Otp.dart';
import '../Constants/Dimension.dart';
import '../Constants/constants.dart';
import '../CustomWidget/CustomSnackBar.dart';
import 'SignUp.dart';

class SignIn extends StatelessWidget {
 const SignIn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final formKey=GlobalKey<FormState>();
    String verificationId = '';
    TextEditingController _Controller=TextEditingController();
    return Scaffold(
      body: Form(key: formKey,
        child: SafeArea(
            child: SingleChildScrollView(physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: D.Hight100/2,
              ),
              SizedBox(
                height: D.Hight30,
              ),
              Padding(
                padding:  EdgeInsets.only(left:D.Hight20),
                child: CustomText("",
                    txt: "Welcome Back !!",
                    txtSize: D.Hight30,
                    clr: Colors.black,
                    bold: true),
              ),
              SizedBox(
                height: D.Hight20,
              ),
              Padding(
                padding:  EdgeInsets.only(left:D.Hight20),
                child: CustomText("",
                    txt: "Please SignIN with Your Phone number",
                    txtSize: D.Hight30 / 2,
                    clr: Colors.black87,
                    bold: false),
              ),
              SizedBox(
                height: D.Hight10,
              ),
              Center(child: PhoneNo(Controller: _Controller,)),
              SizedBox(
                height: D.Hight30,
              ),
              GestureDetector(onTap: () async {
    if (formKey.currentState!.validate()) {
      print("+91${_Controller.text}");
      _auth.verifyPhoneNumber(phoneNumber: "+91${_Controller.text}",
          verificationCompleted: (PhoneAuthCredential credential )async{},
          verificationFailed: (a){},
          codeSent:  (VerificationId, ResendingToken) async {
        verificationId=VerificationId;
        Snack("OTP Sent SucessFully to +91${_Controller.text}",
            "", Colors.greenAccent, Colors.black87);
        await Get.to(OTp(verificationId: verificationId,));
          }, codeAutoRetrievalTimeout: (y){});




    }
              },
                child: CustomButton(
                  txt: 'Continue     ',
                  clr: g1,
                  iconData: Icons.add,
                  iconclr: g1,
                  txtColor: Colors.black,
                ),
              ),
              SizedBox(
                height: D.Hight20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText("",
                      txt: "OR",
                      txtSize: D.Hight30 / 1.5,
                      clr: Colors.black,
                      bold: true),
                ],
              ),
              Divider(
                height: D.Hight10,
              ),
              SizedBox(
                height: D.Hight20,
              ),
              CustomButton2(
                txt: "Connect to Google",
                clr: g2,
                iconData:
                    "https://seeklogo.com/images/G/google-2015-logo-65BBD07B01-seeklogo.com.png",
                iconclr: Colors.orange,
                txtColor: Colors.black,
              ),
              SizedBox(
                height: D.Hight20,
              ),
              CustomButton2(
                txt: "Connect To Metamask",
                clr: g2,
                iconData:
                    "https://seeklogo.com/images/M/metamask-logo-09EDE53DBD-seeklogo.com.png",
                iconclr: Colors.orange,
                txtColor: Colors.black,
              ),
              SizedBox(
                height: D.Hight20,
              ),
              CustomButton(
                txt: "Connect to Apple ",
                clr: Colors.black,
                iconData: Icons.apple,
                iconclr: Colors.white,
                txtColor: Colors.white,
              ),
              SizedBox(
                height: D.Hight10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText("",
                      txt: "Dont have an account?  ",
                      txtSize: D.Hight20 / 1.1,
                      clr: Colors.black,
                      bold: false),
                  GestureDetector(onTap: (){Get.to(SignUp(),transition: Transition.rightToLeftWithFade);},
                    child: CustomText("",
                        txt: "SignUp ", txtSize: D.Hight20, clr: g1, bold: true),
                  ),
                ],
              ),
              SizedBox(
                height: D.Hight100,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
