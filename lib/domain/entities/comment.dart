class Comment {
  final String id;
  final String momentId;
  final String content;
  final String userId;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.momentId,
    required this.content,
    required this.userId,
    required this.createdAt,
  });
}