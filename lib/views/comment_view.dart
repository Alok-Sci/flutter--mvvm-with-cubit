import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_cubit/models/comment.dart';
import 'package:mvvm_with_cubit/viewmodels/comment_view_model.dart';
// import 'package:flutter/rendering.dart';

@immutable
class CommentView extends StatelessWidget {
  final CommentViewModel commentViewModel = CommentViewModel();
  final _scrollController = ScrollController();

  CommentView() {
    commentViewModel.loadComments();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        print('Loading Comments......');
        commentViewModel.loadComments();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build method running------------------');
    return Scaffold(
        appBar: AppBar(title: Text('Comment Screen')),
        body: BlocBuilder<CommentViewModel, List<Comment>>(
          bloc: commentViewModel,
          builder: (context, commentList) { // ! context and current state
            // ! add listener to the scroll controller

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        dragStartBehavior: DragStartBehavior.start,
                        controller: _scrollController,
                        // shrinkWrap: true,
                        itemCount: commentList.length + 1,
                        // itemCount: 1,
                        itemBuilder: (context, index) {
                          if (index == commentList.length) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Card(
                              child: ListTile(
                            title: Text(commentList[index].name),
                            subtitle: Text(commentList[index].body),
                          ));
                        }),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
