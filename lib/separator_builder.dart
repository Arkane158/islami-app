import 'package:flutter/material.dart';

class SeparatoBuilderWidget extends StatelessWidget {
  const SeparatoBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
    );
  }
}
