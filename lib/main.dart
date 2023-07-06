import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainderapp/controllers/task_controller.dart';
import 'package:remainderapp/routes/pages.dart';
import 'package:remainderapp/routes/routes.dart';
import 'binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      getPages: Pages.routes,
      initialBinding: Binding(),
      initialRoute: Routes.splashPage,
    );
  }
}