import 'package:flutter/material.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:provider/provider.dart';
import 'dart:math' as maths;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaState();
}

class _SebhaState extends State<SebhaTab> {
  double angle = 0;
  static int tasbeh = 0;
  int index = 0;
  static List<String> tasbeha = [
    "الله أكبر",
    "سبحان الله",
    "الحمدلله",
    "لا إاله إلا الله"
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(settingsProvider.currentTheme == ThemeMode.light
                      ? 'assets/images/head_of_seb7a.png'
                      : 'assets/images/head_of_seb7a_dark.png'),
                  GestureDetector(
                    onTap: tasbehfun,
                    child: Transform.rotate(
                      angle: maths.pi / 100 * angle,
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * .1),
                        child: Image.asset(
                            settingsProvider.currentTheme == ThemeMode.light
                                ? 'assets/images/body_of_seb7a.png'
                                : 'assets/images/body_of_seb7a_dark.png'),
                      ),
                    ),
                  )
                ],
              ),
            )),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  AppLocalizations.of(context)!.tasbeh_counter,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                    child: Text(
                  '$tasbeh',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: tasbehfun,
                  child: Text(
                    tasbeha[index],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void tasbehfun() {
    setState(() {
      tasbeh++;
      angle += 100 / 3;
      if (tasbeh % 34 == 0) {
        index++;
        tasbeh = 0;
      }
      if (index == tasbeha.length) {
        index = 0;
      }
    });
  }
}
