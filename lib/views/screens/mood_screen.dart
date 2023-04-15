import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoodLogScreen extends HookConsumerWidget {
  const MoodLogScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Log'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
            ),
          ),
        ],
      ),
    );
  }
}
