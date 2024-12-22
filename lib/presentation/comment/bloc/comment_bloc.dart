import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/comment_repository.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;

  CommentBloc({required this.repository}) : super(CommentInitial()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
    on<DeleteComment>(_onDeleteComment);
    on<UpdateComment>(_onUpdateComment);
  }

  Future<void> _onLoadComments(
    LoadComments event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoading());
    try {
      final comments = await repository.getComments(event.momentId);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onAddComment(
    AddComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      await repository.addComment(
        event.momentId,
        event.content,
        event.userId,
      );
      final comments = await repository.getComments(event.momentId);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onDeleteComment(
    DeleteComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      await repository.deleteComment(event.commentId);
      if (state is CommentLoaded) {
        final currentComments = (state as CommentLoaded).comments;
        emit(CommentLoaded(
          currentComments.where((comment) => comment.id != event.commentId).toList(),
        ));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onUpdateComment(
    UpdateComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      await repository.updateComment(event.commentId, event.content);
      if (state is CommentLoaded) {
        final currentComments = (state as CommentLoaded).comments;
        final updatedComment = await repository.updateComment(
          event.commentId,
          event.content,
        );
        final updatedComments = currentComments.map((comment) {
          return comment.id == event.commentId ? updatedComment : comment;
        }).toList();
        emit(CommentLoaded(updatedComments));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}