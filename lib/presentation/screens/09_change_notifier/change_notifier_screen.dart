import 'package:flutter/material.dart';

class ChangeNotifierScreen extends StatelessWidget {
  static const routeName = '/change-notifier-provider';
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
    );
  }
}
