import 'package:flutter/material.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaState();
}

class _SebhaState extends State<SebhaTab> {
  static int tasbeh = 0;
  static int showinTasbeh = 0;
  static String tasbeha = "الله أكبر";

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Center(
              child: Image.asset(
                  settingsProvider.currentTheme == ThemeMode.light
                      ? 'assets/images/sebha_image.png'
                      : 'assets/images/sebha_image_dark.png'),
            )),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'عدد التسبيحات ',
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
                  '$showinTasbeh',
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
                  onPressed: () {
                    setState(() {
                      if (showinTasbeh == 33) {
                        showinTasbeh = 0;
                      }
                      if (tasbeh >= 33 && tasbeh < 66) {
                        tasbeha = 'سبحان الله';
                      } else if (tasbeh >= 66 && tasbeh < 99) {
                        tasbeha = 'الحمدلله';
                      } else if (tasbeh == 99) {
                        tasbeha = 'لا إاله إالا الله';
                        tasbeh = 0;
                        showinTasbeh = 0;
                      } else if (tasbeh < 33) {
                        tasbeha = 'الله أكبر';
                      }
                      tasbeh++;
                      showinTasbeh++;
                    });
                  },
                  child: Text(
                    tasbeha,
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
}
