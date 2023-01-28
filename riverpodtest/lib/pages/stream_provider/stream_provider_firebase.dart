// Here we will use the Future Provider with Firebase

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/models/usermodel.dart';

CollectionReference aboutData = FirebaseFirestore.instance.collection('users');
final getAboutData =
    StreamProvider.autoDispose<QuerySnapshot>((ref) => aboutData.snapshots());

class ExampleSix extends StatelessWidget {
  const ExampleSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider with Firebase'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Second Screen'),
      ),
      body: Center(child: _buildUserData(ref)),
    );
  }

  Widget _buildUserData(WidgetRef ref) {
    final stream = ref.watch(getAboutData);

    return stream.when(
      data: (QuerySnapshot? value) {
        User user = User.fromMap(value!.docs[0].data() as Map<String, dynamic>);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name),
            const SizedBox(height: 10),
            Text(user.email),
          ],
        );
      },
      error: (error, stackTrace) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
