import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainderapp/constant.dart';
import 'package:remainderapp/controllers/task_controller.dart';

class TaskDetailPage extends StatelessWidget {
  TaskDetailPage({Key? key}) : super(key: key);
  final c = Get.find<TaskController>();
  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Constant.charCoal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:const EdgeInsets.only(right: 8),
                  child: Text(argumentData[0],style: Constant.listTitleStyle_Title,),
                ),
                const SizedBox(height: 5,),
                const Divider(color: Constant.black,),
                const SizedBox(height: 20,),
                Container(
                  margin:const EdgeInsets.only(right: 8),
                  child: Text(argumentData[1].toString(),style: Constant.listTitleStyle_Subtitle,),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    ;
  }
}
