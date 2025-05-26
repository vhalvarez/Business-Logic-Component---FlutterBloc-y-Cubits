import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(child: const Text('Counter value: xxxx')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              // Increment counter logic
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
