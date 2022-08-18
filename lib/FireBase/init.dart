import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '_Auth.dart';

Future<void> init()async{


  Get.lazyPut(() => UpdateC());

}