import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentViewModel extends Cubit<List<Comment>> {
  CommentViewModel() : super([]); // ! initial state

  String commentUrl = 'https://jsonplaceholder.typicode.com/comments';
  Future<void> loadComments() async {
    final response = await http.get(Uri.parse(commentUrl));
    final jsonComment = jsonDecode(response.body) as List<dynamic>;

    final commentList =
        jsonComment.map((comment) => Comment.fromJson(comment)).toList();

    final startIndex = state.length;

    print(startIndex);
    final endIndex = startIndex + 10;
    print(endIndex);
    final commentSublist = commentList.sublist(startIndex, endIndex);

    emit([...state, ...commentSublist]); // ! emit new state
    // emit(commentSublist); // ! emit new state
  }
}
