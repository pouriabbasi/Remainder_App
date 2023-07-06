import 'package:remainderapp/model/note.dart';
import 'package:remainderapp/objectbox.g.dart';


class NoteRepo{
  late Store _store;
  late Box<Note> _repo;


   Future<void> loadDb()async{
    _store = await openStore();
    _repo = _store.box<Note>();
  }

  Note? get(int id){

    return _repo.get(id);
  }

  List<Note> getAll(){

    return _repo.getAll();
  }

  List<Note> searchByAnyThings(String searchText){

    Query<Note> query= _repo.query(
        Note_.title.equals(searchText) |
    Note_.text.equals(searchText) |
    Note_.remindTime.equals(int.parse(searchText))).build();

    // query.close();
    return query.find();

  }

  int add(Note note){

    return _repo.put(note);
  }

  int update(int id , Note newNote){

    var data = _repo.get(id);

    data!.text=newNote.text ?? data.text;
    data.remindTime=newNote.remindTime ?? data.remindTime;
    data.title=newNote.title ?? data.title;
    data.isDone=newNote.isDone ?? data.isDone;

    return _repo.put(data);
  }

  bool delete(int id){
    return _repo.remove(id);
  }

}