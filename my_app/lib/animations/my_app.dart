import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Card Open')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder:
              (_, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: OpenContainer(
                  closedElevation: 0,
                  closedColor: Colors.grey[850]!,
                  openColor: Colors.black,
                  transitionDuration: const Duration(milliseconds: 600),
                  closedBuilder:
                      (_, openContainer) => ListTile(
                        tileColor: Colors.grey[850],
                        title: Text('Task ${index + 1}'),
                        subtitle: const Text('Tap to open details'),
                        onTap: openContainer,
                      ),
                  openBuilder: (_, __) => DetailPage(index: index + 1),
                ),
              ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task $index')),
      body: const Center(
        child: Text('Detailed Task View', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
