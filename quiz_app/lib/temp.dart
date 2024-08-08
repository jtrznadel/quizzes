import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/welcome');
                },
                child: const Text('Welcome page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign-in');
                },
                child: const Text('Login page')),
          ],
        ),
      ),
    );
  }
}
