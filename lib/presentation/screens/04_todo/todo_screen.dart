import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class TodoScreen extends ConsumerWidget {
  static const routeName = '/todo';
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref
            .read(todosProvider.notifier)
            .createTodo(RandomGenerator.getRandomName()),
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoCurrentFilterProvider);
    final todos = ref.watch(filteredTodosProvider);

    return Column(
      children: [
        const ListTile(
          title: Text('List of invited'),
          subtitle: Text('These are the people invited for the party'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: FilterType.all, icon: Text('All')),
            ButtonSegment(value: FilterType.completed, icon: Text('Invited')),
            ButtonSegment(value: FilterType.pending, icon: Text('Not invited')),
          ],
          selected: <FilterType>{currentFilter},
          onSelectionChanged: (value) => ref
              .read(todoCurrentFilterProvider.notifier)
              .setCurrentFilter(value.first),
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                title: Text(todo.description),
                value: todo.done,
                onChanged: (value) =>
                    ref.read(todosProvider.notifier).toggleTodo(todo.id),
              );
            },
          ),
        )
      ],
    );
  }
}
