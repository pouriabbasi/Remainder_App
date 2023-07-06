import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainderapp/constant.dart';
import 'package:remainderapp/controllers/layout_controller.dart';

class LayOutPage extends StatelessWidget {
  LayOutPage({Key? key}) : super(key: key);

  var c = Get.put(LayOutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(()=>
          Scaffold(
            body:
                Stack(
                  children: [
                    c.pages[c.pageIndex.value],
                  ],
                ),

            bottomNavigationBar: ConvexAppBar(
              // color: Constant.sandyBrown,
              elevation: 5.0,
              activeColor: Constant.sandyBrown,
              style: TabStyle.flip,
              height: Get.height * 0.075,
              // curve: Curves.decelerate,
              // curveSize: 20,
              top: -20,
              backgroundColor: Constant.sandyBrown,
              items: [
                TabItem(icon: c.pageIndex.value == 1 ?
                const Icon(Icons.article_rounded,size: 30,color: Constant.black,) :
                const Icon(Icons.article_outlined,size: 35,color: Constant.white,),title: ' '),
                TabItem(icon:c.pageIndex.value == 0 ?
                const Icon(Icons.folder_copy,size: 30,color: Constant.black,):
                const Icon(Icons.folder_copy_outlined,size: 35,color: Constant.white,),title: ' '),
              ],
              onTap: (int newIndex){
                c.pageIndex.value=newIndex;
              },
            ),
          ),
        ),
    );
  }
}
