import 'package:flutter/material.dart';

import 'package:islami/quran/sura_details.dart';
import 'package:islami/quran/sura_details_args.dart';

class SuratTittleStyle extends StatelessWidget {
  final String name;
  final int index;
  const SuratTittleStyle({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailScreen.suraDetailScreenName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
