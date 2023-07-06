import 'dart:async';
import 'package:get/get.dart';
import 'package:remainderapp/routes/routes.dart';

class SplashController extends GetxController{

  @override
  void onInit() {

    Timer(const Duration(seconds: 2),() {
      Get.offNamed(Routes.layoutPage);
    },);
    super.onInit();
  }
}