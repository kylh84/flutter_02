import 'package:flutter/material.dart';

void main() {
  runApp(const FavoritePage());
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _buildHomePage());
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Page')),
      body: Column(
        children: [
          Image.asset("images/lake.jpeg"),
          Row(
            children: [
              Text('Oeschinen Lake Campground'),
              const Icon(Icons.star, color: Colors.red),
              const Text('41'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.location_on),
              Icon(Icons.import_contacts),
              Icon(Icons.access_alarm),
            ],
          ),
          Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the  Bernese Alps. Situated 1,578 meters above sea level, it  is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
          ),
        ],
      ),
    );
  }
}
