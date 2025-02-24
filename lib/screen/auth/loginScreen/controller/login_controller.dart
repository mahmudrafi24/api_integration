import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isChecked = false;

  void toggleCheckbox(bool? value) {
    isChecked = value ?? false;
    update();  
  }
}
