import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// HERE WE WILL USE a CONSUMER IN A WIDGET TO NOT Rebuild all class

// here we create the Provider
final nameProvider = Provider<String>((ref) => 'Muhammad');

class ExampleTwo extends StatelessWidget {
  const ExampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Only Consumer'),
      ),
      body: Center(
        // we use Consumer Here
        child: Consumer(
          builder: (context, ref, child) => Text(ref.read(nameProvider)),
        ),
      ),
    );
  }
}
