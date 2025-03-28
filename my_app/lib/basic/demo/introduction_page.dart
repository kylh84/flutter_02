import 'package:flutter/material.dart';

void main() {
  runApp(IntroductionPage());
}

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _buildHomePage());
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(title: const Text('Introduction Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              overflow: TextOverflow.visible,
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Button Pressed')),
                    );
                  },
                  child: Text('Log in'),
                );
              },
            ),
            Container(
              color: Colors.yellow,
              width: 200,
              height: 200,
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text('Hello World'),
            ),
          ],
        ),
      ),
    );
  }
}
