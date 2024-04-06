import 'package:riverpod_annotation/riverpod_annotation.dart';

part '01_hello_world_provider.g.dart';

@riverpod
String helloWord(HelloWordRef ref) {
  return 'Hello world !';
}
