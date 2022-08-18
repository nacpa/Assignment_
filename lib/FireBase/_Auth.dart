import 'package:get/get.dart';

class UpdateC extends GetxController {
  bool page=false;

  Future<void> Update()async {
    page= !page;
    print("abc");
    update();
  }
}

