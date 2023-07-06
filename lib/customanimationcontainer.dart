import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'constant.dart';
import 'customtextfromfield.dart';
import 'package:vibration/vibration.dart';

class CustomAnimationContainer extends StatefulWidget{
  CustomAnimationContainer({Key? key,required this.width,required this.height, required this.isDone,
     this.titleController, this.textController,required this.remindController,
    this.reminderDateTime,this.initTitleData,this.initTextData,this.initRemindData,
    required this.onPressUpdate,required this.onPressDelete,required this.listViewWidget,
    required this.onLongPress,required this.update,required this.onTapModal,required this.onTap
  }) : super(key: key);

  final bool? isDone;
  final double width;
  final double height;
  final TextEditingController? titleController;
  final TextEditingController? textController;
  final TextEditingController remindController;
  final String? initTitleData;
  final String? initTextData;
  final DateTime? initRemindData;
  final DateTime? reminderDateTime;
  final VoidCallback? onPressUpdate;
  final SlidableActionCallback? onPressDelete;
  final GestureLongPressCallback? onLongPress;
  final Widget listViewWidget;
  final GestureLongPressCallback? update;
  final GestureTapCallback? onTapModal;
  final GestureTapCallback? onTap;

  @override
  State<CustomAnimationContainer> createState() => _CustomAnimationContainerState();
}

class _CustomAnimationContainerState extends State<CustomAnimationContainer> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animationSize;
  late Animation animationColor1;
  late Animation animationColor2;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    if(widget.isDone == true){
      animationController.forward();
    }
    animationSize = Tween<double>(begin: 0,end: Get.width).animate(animationController);
    animationColor1 = ColorTween(begin: Constant.maizeCrayola.withOpacity(0.1), end: Constant.maizeCrayola).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationColor2 = ColorTween(begin: Constant.transparent.withOpacity(0.2), end: Constant.black.withOpacity(0.6)).animate(
        animationController);



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context){
              widget.titleController!.text = widget.initTitleData!;
              widget.textController!.text = widget.initTextData!;
              Get.dialog(
                  Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(100),
                    color: Constant.charCoal,
                    child: Center(
                      child: SizedBox(
                        width: widget.width * 0.55,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextFromField(
                                // initialValue: widget.initTitleData,
                                controller: widget.titleController,
                                backColor: Constant.transparent,
                                hintText: "تیتر",
                                margin: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                                isobSecure: false,
                                maxLine: 1,
                              ),
                              CustomTextFromField(
                                // initialValue: widget.initTextData,
                                width: widget.width * 0.8,
                                controller: widget.textController,
                                backColor: Constant.transparent,
                                hintText: "متن",
                                margin: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                                isobSecure: false,
                              ),
                              CustomTextFromField(
                                hintText: widget.remindController.value.text.isBlank == true
                                    ? ("${JalaliFormatter(widget.initRemindData!.toJalali()).yyyy}/"
                                    "${JalaliFormatter(widget.initRemindData!.toJalali()).mm}/"
                                    "${JalaliFormatter(widget.initRemindData!.toJalali()).dd}")
                                    : widget.reminderDateTime?.toJalali().toJalaliDateTime(),
                                margin:const EdgeInsets.only(left: 5,right: 5,bottom: 20),
                                  isobSecure: false,
                                controller: widget.remindController,
                                backColor: Constant.transparent,
                                inputType: TextInputType.none,
                                onTap: widget.onTapModal
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: widget.height * 0.6 ),
                                child: ElevatedButton(
                                    onPressed: widget.onPressUpdate,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Constant.sandyBrown
                                    ),
                                    child:const Text("بروزرسانی")
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
            backgroundColor: Constant.maizeCrayola,
            foregroundColor: Constant.white,
            icon: Icons.update,
            label: 'بروزرسانی',
            borderRadius: BorderRadius.circular(18.0),
            spacing: 5,
          ),
          const SizedBox(width: 5,),
          SlidableAction(
            onPressed: widget.onPressDelete,
            backgroundColor: Constant.burntSienna,
            foregroundColor: Constant.white,
            icon: Icons.delete,
            label: 'حذف',
            borderRadius: BorderRadius.circular(18.0),
            spacing: 5,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPressEnd: (d)async{
          if(widget.isDone == true){
            animationController.reset();
            animationController.forward();
            if (await Vibration.hasVibrator() == true) {
          Vibration.vibrate(duration: 50);
          }
          }else{
            animationController.reset();
          }
        },
        onLongPress: widget.update,
        child: Stack(
          children: [
            AnimatedBuilder(animation: animationController, builder: (context,v){
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: widget.isDone == false ? Constant.transparent.withOpacity(0.2) :
                      animationColor2.value,
                      border: Border.all(width: 2,color: Constant.sandyBrown,strokeAlign: StrokeAlign.inside,)
                  ),

                  margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: widget.listViewWidget
              );
            }),
            AnimatedBuilder(
                animation: animationController,
                builder: (context,v){
                  return widget.isDone == true ?
                  Container(
                    margin: EdgeInsets.only(right: Get.width * 0.03,left: Get.width * 0.03,top: Get.height * 0.048),
                    width: animationSize.value,
                    height: 6,
                    decoration: BoxDecoration(
                        color: animationColor1.value,
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                  ) :
                  Container();
                }),

          ],
        ),
      ),
    );
  }
}
