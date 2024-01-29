import 'package:get/get.dart';
import 'package:netroxe/src/model/note.dart';
import 'package:netroxe/src/modules/login/login_screen.dart';
import 'package:netroxe/src/modules/note/note_create_screen.dart';
import 'package:netroxe/src/resources/base_repository.dart';
import 'package:netroxe/src/utils/shared_preferences_data_provider.dart';

class HomeScreenController extends GetxController {
  var isBusy = false.obs;
  var notes = <Note>[].obs;

  var prefs = SharedPreferencesDataProvider();
  var repository = BaseRepository();
  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  void getNotes() async {
    try{
      isBusy(true);

      notes(await repository.getNotes());
    }catch(_){}
    finally{
      isBusy(false);
    }
  }

  void logout()async{
    await prefs.clear();
    Get.offAllNamed(LoginScreen.routeName);
  }

  void gotoCreateNote(){
    Get.toNamed(NoteCreateScreen.routeName);
  }

  void gotoNoteEdit(Note note){
    Get.toNamed(NoteCreateScreen.routeName,arguments: note);
  }

  void delete(Note note){
    repository.delete(note);

    // refresh list of notes
    getNotes();
  }
}
