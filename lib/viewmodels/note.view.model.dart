import 'package:mvvm_with_cubit/models/note.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteViewModel extends Cubit<List<Note>> { // ! cubit<state>
  NoteViewModel() : super([]); // ! initial state

  void addNote(Note note) {
    state.add(note);
    emit(List.from(state));
  }
  void updateNote(int index, Note note) {
    state[index] = note;
    emit(List.from(state));
  }
  void deleteNote(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}
