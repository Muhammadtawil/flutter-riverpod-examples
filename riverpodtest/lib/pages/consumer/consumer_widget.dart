import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// here we create the Provider
final nameProvider = Provider<String>((ref) => 'Muhammad');

// we should replace StatelessWidget with ConsumerWidget
class ExampleOne extends ConsumerWidget {
  const ExampleOne({super.key});

  @override
  // we need to add WidgetRef(ref,watch) as an argument beside BuildContext
  Widget build(BuildContext context, ref) {
    // we should create a variable to listen to the Provider
    final name = ref.read(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer Widget'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
