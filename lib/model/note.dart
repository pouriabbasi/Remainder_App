import 'package:objectbox/objectbox.dart';

@Entity(uid: 6189682821285368195)
class Note{

  int id = 0;
  String? text;
  String? title;
  @Property(uid: 1751409116383950591)
  bool? isDone;
  @Property(type: PropertyType.date)
  DateTime? insertTime;

  @Property(type:PropertyType.date)
  DateTime? remindTime;

  // @Transient()
  // bool? isUpdate = false;

  Note({this.text,this.insertTime,this.title,this.isDone ,this.remindTime});


}

