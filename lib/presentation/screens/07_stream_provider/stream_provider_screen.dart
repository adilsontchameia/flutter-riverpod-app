import 'package:flutter/material.dart';

class StreamProviderScreen extends StatelessWidget {
  static const routeName = '/stream-provider';
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
    );
  }
}
