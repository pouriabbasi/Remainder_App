import 'package:get/get.dart';
import 'package:remainderapp/pages/folder_page.dart';
import 'package:remainderapp/pages/task_page.dart';


class LayOutController extends GetxController{
  var pageIndex = 0.obs;

  final pages = [
    TaskPage(),
    FolderPage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}