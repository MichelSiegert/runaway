import 'package:flutter/material.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Runaway"),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: CircularProgressIndicator()));
}
