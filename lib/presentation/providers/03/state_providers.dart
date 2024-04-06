import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increaseBy() => state++;
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  bool toggleDarMode() => state = !state;
}

@riverpod
class UserName extends _$UserName {
  @override
  String build() => 'Adilson Tchameia';

  void changeName(String name) => state = name;
}

// @riverpod
// class RandoNumber extends _$RandoNumber {
//   @override
//   int build() => ref.watch(counterProvider);

//   void randoNumber() => state = Random().nextInt(100);
// }
