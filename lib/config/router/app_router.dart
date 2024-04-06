import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/presentation/screens/screens.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ProviderScreen.routeName,
      builder: (context, state) => const ProviderScreen(),
    ),
    GoRoute(
      path: RouterScreen.routeName,
      builder: (context, state) => const RouterScreen(),
    ),
    GoRoute(
      path: StateProviderScreen.routeName,
      builder: (context, state) => const StateProviderScreen(),
    ),
    GoRoute(
      path: TodoScreen.routeName,
      builder: (context, state) => const TodoScreen(),
    ),
    GoRoute(
      path: FutureProviderScreen.routeName,
      builder: (context, state) => const FutureProviderScreen(),
    ),
    GoRoute(
      path: FamilyFutureScreen.routeName,
      builder: (context, state) => const FamilyFutureScreen(),
    ),
    GoRoute(
      path: StreamProviderScreen.routeName,
      builder: (context, state) => const StreamProviderScreen(),
    ),
    GoRoute(
      path: ChangeNotifierScreen.routeName,
      builder: (context, state) => const ChangeNotifierScreen(),
    ),
    GoRoute(
      path: StateNotifierScreen.routeName,
      builder: (context, state) => const StateNotifierScreen(),
    ),
  ]);
}
