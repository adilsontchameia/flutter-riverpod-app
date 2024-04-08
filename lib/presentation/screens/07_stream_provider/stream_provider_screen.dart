import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/06/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  static const routeName = '/stream-provider';
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChatAsync = ref.watch(usersInChatProvider);

    if (usersInChatAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (usersInChatAsync.hasError) {
      return Text('${usersInChatAsync.error}');
    }

    final users = usersInChatAsync.value;
    return ListView.builder(
      itemCount: users!.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text('Name: $user'),
        );
      },
    );
  }
}
