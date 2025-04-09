import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentCubit extends Cubit<List<Comment>> {
  /// * initial state
  CommentCubit() : super([]);

  /// * url for dummy data
  String commentUrl = 'https://jsonplaceholder.typicode.com/comments';

  /// * load comments from dummy data
  Future<void> loadComments() async {
    /// * make an http get request
    final response = await http.get(Uri.parse(commentUrl));

    /// * parse the response body to json and cast it to a list of dynamic
    final jsonComment = jsonDecode(response.body) as List<dynamic>;

    /// * map the json to a list of comments
    final commentList =
        jsonComment.map((comment) => Comment.fromJson(comment)).toList();

    /// * get the start index of the list
    final startIndex = state.length;

    /// * get the end index of the list
    final endIndex = startIndex + 10;

    /// * get the sublist of the list
    final commentSublist = commentList.sublist(startIndex, endIndex);

    /// * emit the new state
    emit([...state, ...commentSublist]);
  }
}
