import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_tab.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:islami/quran/quran.dart';
import 'package:islami/radio/radio.dart';
import 'package:islami/sebha/sebha.dart';
import 'package:islami/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  static const String screenName = 'Home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.currentTheme == ThemeMode.light
            ? 'assets/images/bg3.png'
            : 'assets/images/bg3_dark.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.app_tittle),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (selectedIndex) {
                setState(() {
                  currentIndex = selectedIndex;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_quran.png')),
                    label: AppLocalizations.of(context)!.quran,
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth,
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.mentions,
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_radio.png')),
                    label: AppLocalizations.of(context)!.radio,
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                    backgroundColor: Theme.of(context).primaryColor),
              ]),
          body: tabs[currentIndex]),
    );
  }

  List<Widget> tabs = [
    const QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const Settings()
  ];
}
