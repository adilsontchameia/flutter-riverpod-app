import 'package:flutter/material.dart';

class StateNotifierScreen extends StatelessWidget {
  static const routeName = '/state-notifier-provider';
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
    );
  }
}
