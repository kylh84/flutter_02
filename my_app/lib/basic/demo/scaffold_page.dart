import 'package:flutter/material.dart';

// Enum declared here
enum PageType { home, search, profile }

void main() {
  runApp(const MyAppPage());
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _selectedIndex = 0;
  final List<String> _pages = ['Home', 'Search', 'Profile'];

  void _onItemTapped(PageType page) {
    setState(() {
      _selectedIndex = page.index;
    });
  }

  void _onFabPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Floating Action Button Pressed")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndex]), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Flutter Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(PageType.home);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(PageType.search);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(PageType.profile);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Current Page: ${_pages[_selectedIndex]}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => _onItemTapped(PageType.values[index]),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: _pages[PageType.home.index],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: _pages[PageType.search.index],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: _pages[PageType.profile.index],
          ),
        ],
      ),
    );
  }
}
