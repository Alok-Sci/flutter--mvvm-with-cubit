// import 'dart:ui';
import 'package:flutter/material.dart';
import 'viewmodels/comment_view_model.dart';
// import 'models/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

// main() {
//   CommentViewModel comment = CommentViewModel();
//   Object first10CommentsList = comment.loadComments();
//   Object second10CommentsList = comment.loadComments();
//   Object third10CommentsList = comment.loadComments();
// }

void  main() =>  runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentViewModel(),
      child: MaterialApp(
        title: 'Demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Home(),
      ),
    );
  }
}
