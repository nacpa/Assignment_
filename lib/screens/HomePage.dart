import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:userauth/CustomWidget/CustomButton.dart';
import 'package:userauth/screens/SignIn.dart';
import '../Constants/Dimension.dart';
import '../Constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ClipRRect(borderRadius: BorderRadius.circular(D.Hight30),
          child: Material(color: Colors.transparent,
            child: InkWell(onTap: (){
              Get.off(SignIn());
            },
              child: Container(height: D.Hight30*1.4,width: D.Hight30*1.4,margin: EdgeInsets.all(D.Hight10/2),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [BoxShadow(offset: Offset(-4,4),blurRadius: 2,spreadRadius: -1,color: Colors.grey.shade300)],
                    shape: BoxShape.circle,color: g1),child: Icon(Icons.arrow_back,size: D.Hight30,),),
            ),
          ),
        ),
SizedBox(height: D.Hight100,),
        Center(child: Container(child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_M9p23l.json"),)),
          SizedBox(height: D.Hight100,),
          GestureDetector(onTap: (){Get.off(SignIn());},
              child: CustomButton(txt: "LogOut", clr: Colors.red, iconData: Icons.logout, iconclr: g2, txtColor: Colors.black))


        ],),
    )
    );
  }
}
