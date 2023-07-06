import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:remainderapp/model/note.dart';
import 'package:remainderapp/repository/note_repo.dart';

import '../model/notification.dart';

class TaskController extends GetxController with GetTickerProviderStateMixin{

  final Rx<TextEditingController> searchController = TextEditingController().obs;
  final Rx<TextEditingController> titleController = TextEditingController().obs;
  final Rx<TextEditingController> textController = TextEditingController().obs;
  final Rx<TextEditingController> remindController = TextEditingController().obs;

  // String? placeTitle;
  // String? placeText;

  dynamic argumentData = Get.arguments;

  NotificationService notif = NotificationService();

  @override
  void onInit() {
    loadDb();

    notif.initialize();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  final dateTimeController=TextEditingController().obs;

  DateTime? reminderDateTime;

  final repo = NoteRepo().obs;

  // int idUpdate = 0;
  // RxBool isUpdate = false.obs;


  RxList<Note> notes = <Note>[].obs;
  RxList<Note> searchedItems = <Note>[].obs;

  Future<void> loadDb()async{
    notes.clear();
    await repo.value.loadDb();
    notes.addAll(repo.value.getAll());
  }

  disposeController(){
    titleController.value.clear();
    textController.value.clear();
    remindController.value.clear();
  }

  loadData(){
    notes.clear();
    notes.addAll(repo.value.getAll());
  }

}