import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_cubit/models/comment_model.dart';
import 'package:mvvm_with_cubit/cubits/comment_cubit.dart';

@immutable
class CommentListView extends StatelessWidget {
  final CommentCubit commentCubit = CommentCubit();
  final _scrollController = ScrollController();

  CommentListView() {
    /// * load comments [when the view is created]
    commentCubit.loadComments();

    /// * add listener to the scroll controller [when the user scrolls to the bottom]
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        /// * load comments [when the user scrolls to the bottom]
        commentCubit.loadComments();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Comments')),
        body: BlocBuilder<CommentCubit, List<Comment>>(
          bloc: commentCubit,
          builder: (context, commentList) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.all(15),
                      dragStartBehavior: DragStartBehavior.start,
                      controller: _scrollController,
                      itemCount: commentList.length + 1,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        if (index == commentList.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Card(
                            child: ListTile(
                          title: Text(commentList[index].name),
                          subtitle: Text(commentList[index].body),
                        ));
                      }),
                ),
              ],
            );
          },
        ));
  }
}
