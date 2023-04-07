import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  final String verses;
  final int vesrsesNumber;

  const Verses({super.key, required this.verses, required this.vesrsesNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Text(
        '$verses ($vesrsesNumber)',
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
