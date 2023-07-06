import 'package:get/get.dart';
import 'package:remainderapp/controllers/animated_conroller.dart';
import 'package:remainderapp/controllers/folder_controller.dart';
import 'package:remainderapp/controllers/layout_controller.dart';
import 'package:remainderapp/controllers/search_controller.dart';
import 'package:remainderapp/controllers/splash_controller.dart';
import 'package:remainderapp/controllers/task_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LayOutController>(() => LayOutController());
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<FolderController>(() => FolderController());
    Get.lazyPut<AnimatedController>(() => AnimatedController());
    Get.lazyPut<SearchController>(() => SearchController());
  }

}