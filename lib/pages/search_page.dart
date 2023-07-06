import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remainderapp/controllers/search_controller.dart';
import 'package:remainderapp/customtextfromfield.dart';

import '../constant.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final c = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.charCoal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(()=>
             Column(
              children: [
                CustomTextFromField(
                  controller: c.searchController.value,
                  onChange: (text){
                    c.searchItemNotes.clear();
                    c.searchItemNotes.value = c.showSearchItem(text);
                  },
                ),
                ListView.builder(
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(c.searchItemNotes[index].title!),
                      subtitle: Text(c.searchItemNotes[index].text       !),
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
