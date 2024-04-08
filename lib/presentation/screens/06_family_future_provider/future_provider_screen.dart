import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/05/futures_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  static const routeName = '/future-family-provider';
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Id: $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'btn-1',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                if (pokemonId <= 1) return;
                pokemonId--;
                setState(() {});
              }
              //       ref.read(pokemonIdProvider.notifier).previousPokemon(),
              ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
              heroTag: 'btn-2',
              child: const Icon(Icons.exposure_plus_1_sharp),
              onPressed: () {
                pokemonId++;
                setState(() {});
              }
              // ref.read(pokemonIdProvider.notifier).nextPokemon(),
              ),
        ],
      ),
    );
  }
}
