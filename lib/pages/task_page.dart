import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:remainderapp/constant.dart';
import 'package:remainderapp/controllers/task_controller.dart';
import 'package:remainderapp/customanimationcontainer.dart';
import 'package:remainderapp/customtextfromfield.dart';
import 'package:remainderapp/model/note.dart';
import 'package:remainderapp/routes/routes.dart';

import '../painted.dart';



class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  final c = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        backgroundColor: Constant.charCoal,
          body: CustomPaint(
            painter: Painted1(),
            child: CustomPaint(
              painter: Painted2(),
              child: Stack(
                 children: [
                   Container(
                     margin: EdgeInsets.symmetric(vertical: Get.height * 0.11),
                     child: SizedBox(
                       width: Get.width,
                       height: Get.height,
                       child: ListView.builder(
                         itemCount: c.notes.isEmpty ? 1 : c.notes.length,
                         itemBuilder: (context , index){
                           if (c.notes.isEmpty == true) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.only(top: Get.height * 0.38),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "کی بهت یادآوری کنم؟",
                                    style: TextStyle(
                                      color: Constant.sandyBrown,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.article_outlined,
                                    color: Constant.sandyBrown,
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return CustomAnimationContainer(
                               width: Get.width,
                               height: Get.height,
                               isDone: c.notes[index].isDone ?? false,
                               titleController: c.titleController.value,
                               textController: c.textController.value,
                               remindController: c.remindController.value,
                               reminderDateTime: c.reminderDateTime,
                               initTitleData: c.notes[index].title,
                               initTextData: c.notes[index].text,
                               initRemindData: c.notes[index].remindTime,
                               onTap: (){
                                 print("onTap");
                                 // c.placeTitle = c.notes[index].title;
                                 // c.placeText = c.notes[index].text;
                                 Get.toNamed(Routes.taskDetailPage, arguments:
                                 [
                                   "${c.notes[index].title}",
                                   "${c.notes[index].text}",
                                 ]
                                 );
                               },
                               update: (){
                                 print("update");
                                 c.repo.value.update(
                                     c.notes[index].id,
                                     Note(
                                       isDone: c.notes[index].isDone == true ? false : true,
                                       // title: c.notes[index].title,
                                       // text: c.notes[index].text,
                                       // remindTime: c.notes[index].remindTime,
                                     ));
                                 c.loadData();

                                 c.notif.showScheduledNotification(
                                     title: c.titleController.value.text,
                                     body: c.textController.value.text,
                                     payload: "payload",
                                     scheduledDate: c.reminderDateTime!);

                                 c.disposeController();
                               },
                               onTapModal: ()async{
                                 final pickedDate = await showModalBottomSheet<Jalali>(
                                   context: Get.overlayContext!,
                                   builder: (context) {
                                     Jalali? tempPickedDate;
                                     return SizedBox(
                                       height: 250,
                                       child: Column(
                                         children: <Widget>[
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: <Widget>[
                                               ElevatedButton(
                                                 child:const Text(
                                                   'لغو',
                                                   style: TextStyle(
                                                     fontFamily: 'Dana',
                                                   ),
                                                 ),
                                                 onPressed: () {
                                                   Get.back();
                                                 },
                                               ),
                                               ElevatedButton(
                                                 child:const Text(
                                                   'تایید',
                                                   style: TextStyle(
                                                     fontFamily: 'Dana',
                                                   ),
                                                 ),
                                                 onPressed: () {
                                                   c.remindController.value.text = Jalali
                                                     (tempPickedDate!.year,tempPickedDate!.month,tempPickedDate!.day,
                                                     tempPickedDate!.hour,tempPickedDate!.minute,
                                                   ).toJalaliDateTime();

                                                   c.reminderDateTime = tempPickedDate!.toDateTime();
                                                   c.notif.showScheduledNotification(
                                                       title: c.titleController.value.text,
                                                       body: c.textController.value.text,
                                                       payload: "payload",
                                                       scheduledDate: tempPickedDate!.toDateTime());
                                                   Get.back();
                                                 },
                                               ),
                                             ],
                                           ),
                                           const Divider(
                                             height: 0,
                                             thickness: 1,
                                           ),
                                           Expanded(
                                             child: CupertinoTheme(
                                               data: const CupertinoThemeData(
                                                 textTheme: CupertinoTextThemeData(
                                                   dateTimePickerTextStyle: TextStyle(fontSize: 20,color: Constant.black),
                                                 ),
                                               ),
                                               child: PCupertinoDatePicker(
                                                 use24hFormat: true,
                                                 mode: PCupertinoDatePickerMode.dateAndTime,
                                                 onDateTimeChanged: (Jalali dateTime) {
                                                   tempPickedDate = dateTime;
                                                 },
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     );
                                   },
                                 );
                               },
                               onPressUpdate: (){
                                 print("onPressUpDate");
                                   c.repo.value.update(c.notes[index].id, Note(
                                     text: c.textController.value.text,
                                     title: c.titleController.value.text,
                                     remindTime: c.reminderDateTime,
                                   ));
                                   Get.back();
                                   c.loadData();
                                   Get.snackbar("", "با موفقیت بروزرسانی شد!",colorText: Constant.white);

                                   c.notif.showScheduledNotification(
                                       title: c.titleController.value.text,
                                       body: c.textController.value.text,
                                       payload: "payload",
                                       scheduledDate: c.reminderDateTime!);

                                   c.disposeController();
                               },
                               onPressDelete: (context){
                                   var r = c.repo.value.delete(c.notes[index].id);
                                   Get.snackbar(c.notes[index].title.toString(), "با موفقیت حذف شد!",colorText: Constant.white);
                                   c.loadData();
                               },
                                listViewWidget: ListTile(
                                 title: Text(c.notes[index].title ?? "",
                                   style: Constant.listTitleStyle_Title,
                                   overflow: TextOverflow.ellipsis,),
                                 subtitle: Text(c.notes[index].text ?? "",
                                   style: Constant.listTitleStyle_Subtitle,
                                   overflow: TextOverflow.ellipsis,),
                                 trailing: Text(c.notes[index].remindTime == null  ?
                                 "" : "${JalaliFormatter(c.notes[index].remindTime!.toJalali()).yyyy}/"
                                     "${JalaliFormatter(c.notes[index].remindTime!.toJalali()).mm}/"
                                     "${JalaliFormatter(c.notes[index].remindTime!.toJalali()).dd}"
                                     "\n${c.notes[index].remindTime!.hour}:"
                                     "${c.notes[index].remindTime!.minute}",
                                   style: Constant.listTitleStyle_Trailing,
                                 ),
                               ),
                               onLongPress: (){
                                   var p = c.repo.value.update(c.notes[index].id, Note(
                                     isDone: !c.notes[index].isDone!,
                                     title: c.notes[index].title,
                                     text: c.notes[index].text,
                                     remindTime: c.notes[index].remindTime,
                                   ));
                                   c.loadData();

                                   c.notif.showScheduledNotification(
                                       title: c.titleController.value.text,
                                       body: c.textController.value.text,
                                       payload: "payload",
                                       scheduledDate: c.reminderDateTime!);

                                   c.disposeController();
                               });
                         },
                       ),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(top: 10),
                     child: IconButton(
                         onPressed: (){
                           Get.toNamed(Routes.searchPage);
                         },
                         icon: const Icon(Icons.search_outlined,size: 30,color: Constant.sandyBrown,)
                     ),
                   )
                 ],
              ),
            ),
          ),
         floatingActionButton: FloatingActionButton(
           onPressed: (){
             Get.dialog(
                 Material(
                   type: MaterialType.transparency,
                   borderRadius: BorderRadius.circular(100),
                   color: Constant.charCoal,
                   child: Center(
                     child: SizedBox(
                       width: Get.width * 0.55,
                       child: SingleChildScrollView(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 CustomTextFromField(
                                   controller: c.titleController.value,
                                   backColor: Constant.transparent,
                                   hintText: "تیتر",
                                   margin: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                                   isobSecure: false,
                                   maxLine: 1,
                                 ),
                                 CustomTextFromField(
                                   width: Get.width * 0.8,
                                   controller: c.textController.value,
                                   backColor: Constant.transparent,
                                   hintText: "متن",
                                   margin: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                                   isobSecure: false,
                                 ),
                                 CustomTextFromField(
                                   hintText: c.remindController.value.text.isBlank == true ? "کی یادت بندارم؟" :
                                   c.reminderDateTime!.toJalali().toJalaliDateTime(),
                                   margin:const EdgeInsets.only(left: 5,right: 5,bottom: 20),
                                   isobSecure: false,
                                   controller: c.remindController.value,
                                   backColor: Constant.transparent,
                                   inputType: TextInputType.none,
                                   onTap: ()async{
                                     final pickedDate = await showModalBottomSheet<Jalali>(
                                       context: context,
                                       builder: (context) {
                                         Jalali? tempPickedDate;
                                         return SizedBox(
                                           height: 250,
                                           child: Column(
                                             children: <Widget>[
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: <Widget>[
                                                   ElevatedButton(
                                                     child:const Text(
                                                       'لغو',
                                                       style: TextStyle(
                                                         fontFamily: 'Dana',
                                                       ),
                                                     ),
                                                     onPressed: () {
                                                       Get.back();
                                                     },
                                                   ),
                                                   ElevatedButton(
                                                     child:const Text(
                                                       'تایید',
                                                       style: TextStyle(
                                                         fontFamily: 'Dana',
                                                       ),
                                                     ),
                                                     onPressed: () {
                                                       c.remindController.value.text = Jalali
                                                         (tempPickedDate!.year,tempPickedDate!.month,tempPickedDate!.day,
                                                         tempPickedDate!.hour,tempPickedDate!.minute,
                                                       ).toJalaliDateTime();

                                                       c.reminderDateTime = tempPickedDate!.toDateTime();

                                                       print(c.reminderDateTime);
                                                       Get.back();
                                                     },
                                                   ),
                                                 ],
                                               ),
                                               const Divider(
                                                 height: 0,
                                                 thickness: 1,
                                               ),
                                               Expanded(
                                                 child: CupertinoTheme(
                                                   data: const CupertinoThemeData(
                                                     textTheme: CupertinoTextThemeData(
                                                       dateTimePickerTextStyle: TextStyle(fontSize: 20,color: Constant.black),
                                                     ),
                                                   ),
                                                   child: PCupertinoDatePicker(
                                                     use24hFormat: true,
                                                     mode: PCupertinoDatePickerMode.dateAndTime,
                                                     onDateTimeChanged: (Jalali dateTime) {
                                                       tempPickedDate = dateTime;
                                                     },
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         );
                                       },
                                     );
                                   },
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(bottom: Get.height * 0.6 ),
                                   child: ElevatedButton(
                                       onPressed: (){
                                         c.repo.value.add(Note(
                                           title: c.titleController.value.text,
                                           text: c.textController.value.text,
                                           remindTime: c.reminderDateTime,
                                           insertTime: DateTime.now(),
                                           isDone: false,
                                         ));
                                         Get.back();
                                         c.loadData();

                                         Get.snackbar(c.titleController.value.text, "با موفقیت ثبت شد!",colorText: Constant.white);

                                         c.notif.showScheduledNotification(
                                             title: c.titleController.value.text,
                                             body: c.textController.value.text,
                                             payload: "payload",
                                             scheduledDate: c.reminderDateTime!);

                                         c.disposeController();
                                       },
                                       style: ElevatedButton.styleFrom(
                                           backgroundColor: Constant.sandyBrown
                                       ),
                                       child:const Text("ثبت")
                                   ),
                                 )
                               ],
                             ),
                       ),
                     ),
                   ),
                 )
             );
           },
           backgroundColor: Constant.sandyBrown,
           child:const Icon(Icons.add,size: 35,color: Constant.white,),
         ),
      ),
    );
  }
}
