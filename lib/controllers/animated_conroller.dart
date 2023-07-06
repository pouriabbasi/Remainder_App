import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AnimatedController extends GetxController with GetTickerProviderStateMixin{


  late Animation<double> animation1;
  late AnimationController animationController1;

  late Animation<double> animation2;
  late AnimationController animationController2;

  @override
  void onInit() {
    animationController1 = AnimationController(vsync: this,duration:const Duration(milliseconds: 1000));
    CurvedAnimation curved = CurvedAnimation(parent: animationController1, curve: Curves.ease);
    animation1=Tween(begin: 70.0,end:100.0).animate(curved);
    animation1.addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
        animationController1.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController1.forward();
      }
    });
    animationController1.forward();

    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController2,
      curve: Curves.ease,
    ));

    animationController2.forward();

    super.onInit();
  }

  @override
  void onClose() {

    animationController1.dispose();
    animationController2.dispose();
    super.onClose();
  }
}