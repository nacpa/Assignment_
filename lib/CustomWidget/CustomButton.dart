import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userauth/CustomWidget/CustomText.dart';

import '../Constants/Dimension.dart';
import '../Constants/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.txt,
    required this.clr,
    required this.iconData,
    required this.iconclr,
    required this.txtColor
  }) : super(key: key);
  Color clr;
  String txt;
  IconData iconData;
  Color iconclr;
  Color txtColor;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: D.Hight30*1.5,
        width: D.Hight100 * 3,
        decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(-4,4),blurRadius: 1,spreadRadius: -2,color: Colors.grey.shade300)],
            color: clr,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(D.Hight30)),
      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(iconData,size: D.Hight30,color: iconclr,),
        SizedBox(width: D.Hight10/2,),
        CustomText("", txt: txt, txtSize: D.Hight20, clr: txtColor, bold: false),

      ],)
        ,),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({
    Key? key,
    required this.txt,
    required this.clr,
    required this.iconData,
    required this.iconclr,
    required this.txtColor
  }) : super(key: key);
  Color clr;
  String txt;
  String iconData;
  Color iconclr;
  Color txtColor;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: D.Hight30*1.5,
        width: D.Hight100 * 3,
        decoration: BoxDecoration(
            // boxShadow: [BoxShadow(offset: Offset(-4,4),blurRadius: 1,spreadRadius: -2,color: Colors.grey.shade300)],
            color: clr,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(D.Hight30)),
      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(margin: EdgeInsets.only(left: D.Hight10),
            height: D.Hight30,width: D.Hight30,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(iconData)),),),

          SizedBox(width: D.Hight10,),
        CustomText("", txt: txt, txtSize: D.Hight20/1.3, clr: txtColor, bold: false),

      ],)
        ,),
    );
  }
}
