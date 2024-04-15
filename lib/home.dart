import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_with_cubit/views/comment_view.dart';
import 'package:mvvm_with_cubit/views/note.view.dart';
import 'package:mvvm_with_cubit/views/user.view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
                title: Text('Notes'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoteListView()));
                }),
            ListTile(
                title: Text('User: Cubit Practice'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserView()));
                }),
            ListTile(
                title: Text('Comments: Infinite Scroll'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CommentView()));
                }),
          ],
        )));
  }
}
