import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:userauth/screens/SignIn.dart';
import 'package:userauth/screens/SignUp.dart';
import '../Constants/Dimension.dart';
import '../Constants/constants.dart';
import '../FireBase/_Auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  bool page=false;
  int index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: D.Hight100 / 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: D.Hight20),
            child: !page? Container(
              height: D.Hight100 / 2,
              width: D.Hight100 * 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.Hight30),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  Container(
                    height: D.Hight100 / 2,
                    width: D.Hight100,
                    decoration: BoxDecoration(
                        color: g1,
                        borderRadius: BorderRadius.circular(D.Hight100 / 2)),
                    child: Center(child: Text("SignUp")),
                  ),
                  Expanded(child: GestureDetector(onTap: (){  setState(() {
                    page=!page;
                  });},
                      child: Center(child: Text("SignIN",style: TextStyle(color: Colors.black87,),))),)

                ],
              ),
            ): Container(
              height: D.Hight100 / 2,
              width: D.Hight100 * 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.Hight30),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  Expanded(child: GestureDetector(onTap: (){  setState(() {
                    page=!page;
                  });},
                      child: Container(child: Center(child: Text("SignUp"))))),
                  GestureDetector(onTap: (){

                  },
                    child: Container(
                      height: D.Hight100 / 2,
                      width: D.Hight100,
                      decoration: BoxDecoration(
                          color: g1,
                          borderRadius: BorderRadius.circular(D.Hight100 / 2)),
                      child: Center(child: Text("SignIN")),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(child: page ? SignIn() : SignUp())
        ]),
      ),
    );
  }
}
