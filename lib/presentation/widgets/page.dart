import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final List<Widget> slivers;

  const BasePage({required this.slivers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: slivers,
      ),
    );
  }
}
