import 'package:flutter/material.dart';
import 'package:islami/quran/names.dart';
import 'package:islami/quran/sura_tittle_style.dart';
import 'package:islami/separator_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/images/home_screen.png'),
      Container(color: Theme.of(context).colorScheme.secondary, height: 2),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocalizations.of(context)!.chapter_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Container(
        color: Theme.of(context).colorScheme.secondary,
        height: 2,
      ),
      Expanded(
        child: ListView.separated(
            itemBuilder: (_, index) {
              return SuratTittleStyle(
                name: SuraNames.names[index],
                index: index,
              );
            },
            separatorBuilder: (_, index) {
              return const SeparatoBuilderWidget();
            },
            itemCount: SuraNames.names.length),
      )
    ]);
  }
}
