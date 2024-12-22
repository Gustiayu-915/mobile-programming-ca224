// lib/presentation/comment/screens/comment_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/comment_bloc.dart';
import '../bloc/comment_event.dart';
import '../bloc/comment_state.dart';
import '../../../data/repositories/comment_repository.dart';

class CommentScreen extends StatelessWidget {
  final String momentId;
  
  const CommentScreen({Key? key, required this.momentId}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    // Ambil repository dari context
    final repository = context.read<CommentRepository>();
    
    return BlocProvider(
      create: (context) => CommentBloc(
        repository: repository,
      )..add(LoadComments(momentId)),
      child: CommentView(momentId: momentId),
    );
  }
}

class CommentView extends StatelessWidget {
  final String momentId;

  const CommentView({Key? key, required this.momentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CommentLoaded) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return ListTile(
                  title: Text(comment.content),
                  subtitle: Text('By: ${comment.userId}'),
                );
              },
            );
          } else if (state is CommentError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No comments'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementasi untuk menambah komentar
          context.read<CommentBloc>().add(
                AddComment(momentId, 'New comment', 'currentUserId'),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}