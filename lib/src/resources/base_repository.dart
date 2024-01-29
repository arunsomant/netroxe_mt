

import 'package:hive_flutter/hive_flutter.dart';
import 'package:netroxe/src/configs/app_config.dart';
import 'package:netroxe/src/model/note.dart';
import 'package:netroxe/src/model/user.dart';
import 'package:netroxe/src/utils/shared_preferences_data_provider.dart';
import 'package:collection/collection.dart';

class BaseRepository {
  late final _preferences = SharedPreferencesDataProvider();

  Future<bool> register(String name,String email,String password) async {
    Box<User> users = Hive.box<User>(AppConfig.appUserBox);
    var exists = users.values.firstWhereOrNull((element) => element.email == email);
    if(exists!=null){
      return false;
    }else{
      // todo here password is saved as plain text, change it to use some encryption like bcrypt or md5 later
      users.add(User(name,email,password));
      return true;
    }
  }

  Future<User?>  login(String email,String password)async{
    Box<User> users = Hive.box<User>(AppConfig.appUserBox);
    return users.values.firstWhereOrNull((element) => element.email == email && element.password == password);
  }


  // todo separate notes crud to diff repo later
  Future<bool> createNote(String title,String content,String category) async {
    Box<Note> notes = Hive.box<Note>(AppConfig.appNotesBox);
    await notes.add(Note(title, content, category, DateTime.now()));
    return true;
  }

  Future<bool> updateNote(String title,String content,String category,Note note) async {
    Box<Note> notes = Hive.box<Note>(AppConfig.appNotesBox);
    note.title = title;
    note.content = content;
    note.category = category;
    note.save();
    return true;
  }


  Future<List<Note>> getNotes() async {
    Box<Note> notes = Hive.box<Note>(AppConfig.appNotesBox);
    return notes.values.toList();
  }

  Future<bool> delete(Note note){
    note.delete();
    return Future.value(true);
  }
}
