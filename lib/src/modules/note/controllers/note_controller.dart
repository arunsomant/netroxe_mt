import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/model/note.dart';
import 'package:netroxe/src/modules/home/controllers/home_screen_controller.dart';
import 'package:netroxe/src/resources/base_repository.dart';

class NoteController extends GetxController {
  var isBusy = false.obs;

   TextEditingController titleController = TextEditingController();
   TextEditingController contentController = TextEditingController();

   var selectedCategory = Note.categories.first.obs;

   var formKey = GlobalKey<FormState>();

   var repository = BaseRepository();

   var note = Rxn<Note>();

   @override
  void onInit() {
    note(Get.arguments);
    if(note.value!=null){
      titleController.text = note.value?.title ?? "";
      contentController.text = note.value?.content ?? "";
      selectedCategory(note.value?.category);
    }
    super.onInit();
  }

  // better to separate in to diff methods
  void createOrEdit() async {
    if(!formKey.currentState!.validate()){
      return;
    }

    try{
      isBusy(true);
      var response = note.value == null ? await repository.createNote(titleController.text, contentController.text, selectedCategory.value) : await repository.updateNote(titleController.text, contentController.text, selectedCategory.value,note.value!);
      if(response){
        Fluttertoast.showToast(msg: note.value == null ? "Note added" : "Note updated");
        Get.back();
        // refresh list of notes in home screen
        Get.find<HomeScreenController>().getNotes();
      }else{
        Fluttertoast.showToast(msg: note.value == null ? "Failed to add note!" : "Failed to update note!");
      }
    }catch(_){
      debugPrint(_.toString());
      Fluttertoast.showToast(msg: _.toString());
    }finally{
      isBusy(false);
    }
  }
}
