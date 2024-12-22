import '../../domain/entities/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(String momentId);
  Future<Comment> addComment(String momentId, String content, String userId);
  Future<void> deleteComment(String commentId);
  Future<Comment> updateComment(String commentId, String content);
}