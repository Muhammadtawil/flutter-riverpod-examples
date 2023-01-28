import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleFour extends StatelessWidget {
  const ExampleFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider with Api'),
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
// If we need to not save data ic cach memory and reload it again  use AutoDispose
// ^^^^^^^^^^^^^^^^ below Example ^^^^^^^^^^^^^

// final dataProvider = FutureProvider.autoDispose<String>((ref) => fetchData());

// Future Function
Future<String> fetchData() async {
  const url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);
  return data[0]['body'];
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
