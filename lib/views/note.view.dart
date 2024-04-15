// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/note.model.dart';
import 'package:mvvm_with_cubit/viewmodels/note.view.model.dart';

class NoteListView extends StatelessWidget {
  final NoteViewModel noteViewModel = NoteViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Note'),
        onPressed: () {
          _addNote(context);
        },
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Bloc tutorial')),
      body: BlocBuilder<NoteViewModel, List<Note>>(  // ! accept a bloc and state
        bloc: noteViewModel, // ! bloc is linked with the NoteViewModel
        builder: (context, notes) => ListView.builder(
          // ! notes is linked with the List<Note>
          itemCount: notes.length,
          itemBuilder: (context, index) => Card(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
              onTap: () {
                _editNote(context, notes[index], index);
              },
            ),
          ),
        ),
      ),
    );
  }

// method to add new note
  void _addNote(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          String title = '';
          String content = '';

          print('title' + title);
          print('content' + content);

          return AlertDialog(
            title: Text('Add note'),
            content: Column(children: [
              TextField(
                controller: TextEditingController(text: title),
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  ),
                onChanged: (value) {
                  // ! on change event grab the value
                  title = value; // ! and set it as the title
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: TextEditingController(text: content), // ! adding a controller to the text field to grab it's value
                  decoration: InputDecoration(labelText: 'Content', border: OutlineInputBorder(), ),
                  onChanged: (value) {
                    print(content);
                    content = value;
                  }),
            ]),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    print('title' + title);
                    print('content' + content);

                    Note note = Note(
                        title: title,
                        content:
                            content); // ! create a new note with new title and content from textfields
                    noteViewModel.addNote(note);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add Note'))
            ],
          );
        });
  }

// method to edit new note
  void _editNote(BuildContext context, Note note, int index) {
    showDialog(
        context: context,
        builder: (context) {
          String title = note.title;
          String content = note.content;

          return AlertDialog(
            title: Text('Edit note'),
            content: Column(
              children: [
                TextField(
                  controller: TextEditingController(text: title),
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                  ),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(),
                TextField(
                  controller: TextEditingController(text: content),
                  decoration: InputDecoration(labelText: 'Enter content'),
                  onChanged: (value) {
                    content = value;
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                child: Text('Update note'),
                onPressed: () {
                  Note updatedNote = Note(
                    title: title,
                    content: content,
                  );
                  noteViewModel.updateNote(index, updatedNote);
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text('Delete'),
                onPressed: () {
                  noteViewModel.deleteNote(index);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
