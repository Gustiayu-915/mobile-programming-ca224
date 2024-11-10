import 'package:flutter/material.dart';

void main() => runApp(const InstagramSearchClone());

class InstagramSearchClone extends StatelessWidget {
  const InstagramSearchClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        // accentColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: const [
            Tab(icon: Icon(Icons.home, color: Colors.black)),
            Tab(icon: Icon(Icons.search, color: Colors.black)),
            Tab(icon: Icon(Icons.person, color: Colors.black)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Home Page')),
          SearchPage(),
          Center(child: Text('Profile Page')),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Jumlah kolom
          crossAxisSpacing: 4, // Jarak horizontal antar gambar
          mainAxisSpacing: 4, // Jarak vertikal antar gambar
        ),
        itemCount: 30, // Jumlah gambar
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Image ${index + 1}',
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          );
        },
      ),
    );
  }
}
