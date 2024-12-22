import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComments extends CommentEvent {
  final String momentId;

  const LoadComments(this.momentId);

  @override
  List<Object> get props => [momentId];
}

class AddComment extends CommentEvent {
  final String momentId;
  final String content;
  final String userId;

  const AddComment(this.momentId, this.content, this.userId);

  @override
  List<Object> get props => [momentId, content, userId];
}

class DeleteComment extends CommentEvent {
  final String commentId;

  const DeleteComment(this.commentId);

  @override
  List<Object> get props => [commentId];
}

class UpdateComment extends CommentEvent {
  final String commentId;
  final String content;

  const UpdateComment(this.commentId, this.content);

  @override
  List<Object> get props => [commentId, content];
}