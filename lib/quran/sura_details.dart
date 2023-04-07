import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:islami/quran/sura_details_args.dart';
import 'package:islami/quran/verses.dart';
import 'package:islami/separator_builder.dart';
import 'package:provider/provider.dart';

class SuraDetailScreen extends StatefulWidget {
  static const String suraDetailScreenName = "suraDetailScreen";
  const SuraDetailScreen({super.key});

  @override
  State<SuraDetailScreen> createState() => _SuraDetailScreenState();
}

class _SuraDetailScreenState extends State<SuraDetailScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      readData(args.index + 1);
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    settingsProvider.currentTheme == ThemeMode.light
                        ? 'assets/images/bg3.png'
                        : 'assets/images/bg3_dark.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  elevation: 12,
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return Verses(
                          verses: verses[index], vesrsesNumber: index + 1);
                    },
                    separatorBuilder: (_, __) {
                      return const SeparatoBuilderWidget();
                    },
                    itemCount: verses.length,
                  ),
                ),
        ));
  }

  void readData(int suraIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/text/$suraIndex.txt');
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      verses = lines;
    });

    // ignore: avoid_print
  }
}
