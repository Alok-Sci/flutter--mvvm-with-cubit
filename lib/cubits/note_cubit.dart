import 'package:flutter/material.dart';
import 'package:mvvm_with_cubit/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCubit extends Cubit<List<Note>> {
  /// * Note initial state
  NoteCubit() : super([]);

  /// ! add note
  void addNote(Note note) {
    /// * add new note object to the current state
    state.add(note);

    /// * emit the new state
    emit(List.from(state));
  }

  /// ! update note
  void updateNote(int index, Note note) {
    /// * update the note object at the given index
    state[index] = note;

    /// * emit the new state
    emit(List.from(state));
  }

  /// ! delete note
  void deleteNote(int index) {
    /// * remove the note object at the given index
    state.removeAt(index);

    /// * emit the new state
    emit(List.from(state));
  }
}
