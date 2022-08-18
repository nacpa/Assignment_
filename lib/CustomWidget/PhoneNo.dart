import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userauth/CustomWidget/CustomText.dart';
import '../Constants/Dimension.dart';

class PhoneNo extends StatelessWidget {
   PhoneNo({Key? key,required this.Controller}) : super(key: key);
  TextEditingController Controller;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: D.Hight30 * 1.4,
      width: D.Hight100 * 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.Hight10),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: D.Hight10),
            height: D.Hight30,
            width: D.Hight30,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/321/321238.png")),
            ),
          ),
          CustomText("",
              txt: " +91",
              txtSize: D.Hight20 / 1.5,
              clr: Colors.grey,
              bold: false),
          CustomText("",
              txt: " | ", txtSize: D.Hight20, clr: Colors.grey, bold: false),
          Container(
              height: D.Hight30 * 1.2,
              width: D.Hight100 * 2,
              child: Center(
                  child: TextFormField( controller: Controller,
                decoration: InputDecoration.collapsed(
                  hintText: "Phonne No",
                ),
                keyboardType: TextInputType.phone,
                    validator: (val){
                      if (val!.isEmpty ||
                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                              .hasMatch(val)|| val.length!=10) {
                        return "Enter Valid Phone Number";
                      } else {
                        return null;
                      }
                    },
              )

                  ))
        ],
      ),
    );
  }
}
