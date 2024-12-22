import '../../domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    required String id,
    required String momentId,
    required String content,
    required String userId,
    required DateTime createdAt,
  }) : super(
          id: id,
          momentId: momentId,
          content: content,
          userId: userId,
          createdAt: createdAt,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      momentId: json['moment_id'],
      content: json['content'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'moment_id': momentId,
      'content': content,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}