import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        // accentColor: const Color(0xFF25D366),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
          actions: const [
            Icon(Icons.search),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Chats")),
            Center(child: Text("Status")),
            Center(child: Text("Calls")),
          ],
        ),
      ),
    );
  }
}
