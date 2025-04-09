import 'package:flutter/material.dart';
import 'package:mvvm_with_cubit/views/comments_list_view.dart';
import 'package:mvvm_with_cubit/views/notes_list_view.dart';
import 'package:mvvm_with_cubit/views/user_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),

          /// * Notes tile
          ListTile(
            leading: Icon(Icons.note, size: 20),
            title: Text('Notes'),
            subtitle: Text('Add, Update, Delete notes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesListView()),
              );
            },
          ),
          Divider(
            height: 1,
          ),

          /// * User tile
          ListTile(
            leading: Icon(Icons.person, size: 20),
            title: Text('User'),
            subtitle: Text('Update profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserView()),
              );
            },
          ),
          Divider(
            height: 1,
          ),

          /// * Comments tile
          ListTile(
            leading: Icon(Icons.comment, size: 20),
            title: Text('Comments'),
            subtitle: Text('Infinite Scroll, Pagination'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommentListView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
