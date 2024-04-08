import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/05/futures_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  static const routeName = '/future-provider';
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data),
          error: (error, stack) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon(Icons.minimize),
            onPressed: () =>
                ref.read(pokemonIdProvider.notifier).previousPokemon(),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon(Icons.add),
            onPressed: () => ref.read(pokemonIdProvider.notifier).nextPokemon(),
          ),
        ],
      ),
    );
  }
}
