import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 2)
class Note extends HiveObject{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? content;

  @HiveField(2)
  String? category;

  @HiveField(3)
  DateTime? createdAt;

  Note(this.title,this.content,this.category,this.createdAt);

  static const categories = ['personal','work'];
}