

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/animated_conroller.dart';

class AnimationSplashTextPage extends StatelessWidget {
  AnimationSplashTextPage({Key? key}) : super(key: key);
  final c = Get.find<AnimatedController>();

  @override
  Widget build(BuildContext context) {

    return FadeTransition(
      opacity: c.animation2,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(c.animation2),
        child: Padding(
          padding: const EdgeInsets.only(right: 15,left: 15,top: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("!!!!!!!" "hellooooooo",
                 style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25.0,color: Colors.red),),

            ],
          ),
        ),
      ),
    );
  }
}
