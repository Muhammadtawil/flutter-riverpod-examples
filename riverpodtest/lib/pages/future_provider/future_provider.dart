import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleThree extends StatelessWidget {
  const ExampleThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SecondScreen(),
              ));
            },
            child: const Text('Go to next Page')),
      ),
    );
  }
}
// CREATE A pROVIDER

final dataProvider = FutureProvider<String>((ref) => fetchData());

// Future Function
Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 3));
  return 'Muhammad Future';
}

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final name = ref.read(dataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Second Screen'),
      ),
      body: Center(
          child: Container(
        child: name.when(
          data: (value) => Text(value),
          error: (error, stackTrace) => const Text('error'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      )),
    );
  }
}
