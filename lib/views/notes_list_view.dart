// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/note_model.dart';
import 'package:mvvm_with_cubit/cubits/note_cubit.dart';

class NotesListView extends StatelessWidget {
  final NoteCubit noteCubit = NoteCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// * FAB to add new note
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Note'),
        onPressed: () => _addNote(context),
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Notes')),
      body: BlocBuilder<NoteCubit, List<Note>>(
        bloc: noteCubit,
        builder: (context, notes) => notes.length > 0
            ? ListView.separated(
                padding: EdgeInsets.all(15),
                itemCount: notes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  /// * get the note at the current index
                  final note = notes[index];

                  return Card(
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      onTap: () => _editNote(context, note, index),
                    ),
                  );
                },
              )
            : Center(
                child: Text('No notes found'),
              ),
      ),
    );
  }

  /// ! method to add new note
  void _addNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        /// * text controllers
        final titleController = TextEditingController();
        final contentController = TextEditingController();

        return AlertDialog(
          title: Text('Add note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                /// * create a new note with new title and content from textfields
                Note note = Note(
                  title: titleController.text,
                  content: contentController.text,
                );

                /// * add the new note to the cubit
                noteCubit.addNote(note);

                /// * clear the textfields
                titleController.clear();
                contentController.clear();

                /// * close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Add Note'),
            )
          ],
        );
      },
    );
  }

  /// ! method to edit new note
  void _editNote(
    BuildContext context,
    Note note,
    int index,
  ) {
    /// * show a dialog to edit the note
    showDialog(
        context: context,
        builder: (context) {
          /// * text controllers
          final titleController = TextEditingController(text: note.title);
          final contentController = TextEditingController(text: note.content);

          return AlertDialog(
            title: Text('Edit note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: 'Enter content'),
                  onChanged: (value) {},
                ),
              ],
            ),
            actions: [
              /// * update note button
              ElevatedButton(
                child: Text('Update note'),
                onPressed: () {
                  /// * create a new note with new title and content from textfields
                  Note updatedNote = Note(
                    title: titleController.text,
                    content: contentController.text,
                  );

                  /// * update the note in the cubit and update the state
                  noteCubit.updateNote(index, updatedNote);

                  /// * close the dialog
                  Navigator.of(context).pop();
                },
              ),

              /// * delete note button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('Delete'),
                onPressed: () {
                  /// * delete the note from the cubit and update the state
                  noteCubit.deleteNote(index);

                  /// * close the dialog
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
