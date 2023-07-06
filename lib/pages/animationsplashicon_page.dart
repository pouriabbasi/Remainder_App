
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../controllers/animated_conroller.dart';

class AnimationSplashIconPage extends StatelessWidget {
   AnimationSplashIconPage({Key? key}) : super(key: key);

  var c = Get.put(AnimatedController());

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: c.animation1,
      builder: (context , widget){
        return SizedBox(
          width: c.animation1.value,
          height: c.animation1.value,
          child: Center(
            child: Icon(Icons.note_alt_rounded,color: Constant.persianGreen,size: c.animation1.value,),
            // ),
          ),
        );
      },
    );
  }
}
