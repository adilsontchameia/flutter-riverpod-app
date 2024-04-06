import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final counter = ref.watch(counterProvider);
    final randomName = ref.watch(userNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(
              darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              size: 100,
            ),
            onPressed: () =>
                ref.read(darkModeProvider.notifier).toggleDarMode(),
          ),
          Text(randomName, style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(Icons.add, size: 50),
            label: Text('$counter', style: const TextStyle(fontSize: 100)),
            onPressed: () => ref.read(counterProvider.notifier).increaseBy(),
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Random name'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () => ref
            .read(userNameProvider.notifier)
            .changeName(RandomGenerator.getRandomName()),
      ),
    );
  }
}
