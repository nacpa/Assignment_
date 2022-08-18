import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void Snack(
    String title, String Message, Color BackgraoundColor, Color TextColor) {
  Get.snackbar( ""
    ,
    Message,
    titleText: Text(title,  style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
    backgroundColor: BackgraoundColor.withOpacity(0.6),duration: Duration(seconds: 3),
    messageText: Text(
      Message,
      style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w600),
    ),
  );
}
