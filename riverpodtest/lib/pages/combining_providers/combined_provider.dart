// Here we will use the Future Provider with Firebase

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// create the providers
final cityProvider = StateProvider<String>((ref) => 'Country one');
final weatherProvider = StateProvider((ref) {
  final city = ref.watch(cityProvider);
  return city == 'Country one'
      ? '25'
      : city == 'Country two'
          ? '30'
          : '50';
});

class ExampleSeven extends StatelessWidget {
  const ExampleSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combining Provider with Firebase'),
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

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    String? city = ref.watch(cityProvider);
    final weather = ref.watch(weatherProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Combining Providers Second Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: city,
                items: const [
                  DropdownMenuItem(
                    value: 'Country one',
                    child: Text('Country one'),
                  ),
                  DropdownMenuItem(
                    value: 'Country two',
                    child: Text('Country two'),
                  ),
                  DropdownMenuItem(
                    value: 'Country three',
                    child: Text('Country three'),
                  ),
                ],
                onChanged: (value) {
                  ref.read(cityProvider.notifier).state = value!;
                },
              ),
              Text(
                weather,
                style: const TextStyle(fontSize: 40),
              ),
            ],
          ),
        ));
  }
}
