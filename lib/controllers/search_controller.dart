import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remainderapp/controllers/task_controller.dart';
import 'package:remainderapp/repository/note_repo.dart';

import '../model/note.dart';

class SearchController extends GetxController{
  final Rx<TextEditingController> searchController = TextEditingController().obs;

  final notes = Get.find<TaskController>().notes;

  NoteRepo repo = NoteRepo();

  List<Note> showSearchItem(String title){
    final list = notes.where((x) => x.title!.contains(title)).toList();
    return list;
  }
  RxList<Note> searchItemNotes=<Note>[].obs;
}