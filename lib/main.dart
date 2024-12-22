// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/comment_repository.dart';
import 'data/repositories/comment_repository_impl.dart';
import 'presentation/comment/screens/comment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CommentRepository commentRepository = CommentRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Comment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CommentRepository>(
            create: (context) => commentRepository,
          ),
        ],
        child: CommentScreen(momentId: 'moment1'),
      ),
    );
  }
}