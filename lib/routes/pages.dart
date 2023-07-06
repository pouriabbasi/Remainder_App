import 'package:get/get.dart';
import 'package:remainderapp/pages/layout_page.dart';
import 'package:remainderapp/pages/search_page.dart';
import 'package:remainderapp/pages/splash_page.dart';
import 'package:remainderapp/pages/task_detail_page.dart';
import 'package:remainderapp/routes/routes.dart';

class Pages{
  static final routes = [
    GetPage(name: Routes.splashPage, page: ()=> SplashPage()),
    GetPage(name: Routes.layoutPage, page: ()=> LayOutPage()),
    GetPage(name: Routes.taskDetailPage, page: ()=> TaskDetailPage()),
    GetPage(name: Routes.searchPage, page: ()=> SearchPage()),
  ];
}