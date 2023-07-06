import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainderapp/controllers/splash_controller.dart';
import 'package:remainderapp/pages/animationsplashicon_page.dart';
import 'package:remainderapp/pages/animationsplashtext_page.dart';

import '../constant.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  var c = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Constant.charCoal,
                    Constant.maizeCrayola,
                    Constant.burntSienna,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimationSplashIconPage(),
              AnimationSplashTextPage(),
            ],
          ),
        ),
      ),
    );
  }
}
