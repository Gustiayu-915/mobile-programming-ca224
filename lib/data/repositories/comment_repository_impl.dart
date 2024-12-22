import '../../domain/entities/comment.dart';
import '../models/comment_model.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  // Disini bisa ditambahkan API client atau database client
  
  @override
  Future<List<Comment>> getComments(String momentId) async {
    // Implementasi untuk mengambil komentar dari API atau database
    try {
      // Contoh implementasi mock
      await Future.delayed(Duration(seconds: 1)); // Simulasi network delay
      return [
        CommentModel(
          id: '1',
          momentId: momentId,
          content: 'Contoh komentar',
          userId: 'user1',
          createdAt: DateTime.now(),
        ),
      ];
    } catch (e) {
      throw Exception('Gagal mengambil komentar');
    }
  }

  @override
  Future<Comment> addComment(String momentId, String content, String userId) async {
    try {
      // Implementasi untuk menambah komentar
      await Future.delayed(Duration(seconds: 1));
      return CommentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        momentId: momentId,
        content: content,
        userId: userId,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Gagal menambah komentar');
    }
  }

  @override
  Future<void> deleteComment(String commentId) async {
    try {
      // Implementasi untuk menghapus komentar
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      throw Exception('Gagal menghapus komentar');
    }
  }

  @override
  Future<Comment> updateComment(String commentId, String content) async {
    try {
      // Implementasi untuk mengupdate komentar
      await Future.delayed(Duration(seconds: 1));
      return CommentModel(
        id: commentId,
        momentId: 'moment1',
        content: content,
        userId: 'user1',
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Gagal mengupdate komentar');
    }
  }
}