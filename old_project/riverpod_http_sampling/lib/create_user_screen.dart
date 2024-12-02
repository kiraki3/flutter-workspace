import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_sampling/api_provider.dart';

class CreateUserScreen extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create User',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _jobController,
              decoration: const InputDecoration(labelText: "Job"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text;
                  final job = _jobController.text;
                  await ref.read(userProvider.notifier).createUser(name, job);
                },
                child: const Text('submit'))
          ],
        ),
      ),
    );
  }
}