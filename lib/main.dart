import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_content.dart';
import 'package:islami/home.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:islami/quran/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProviders(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProviders = Provider.of<SettingsProviders>(context);
    // ignore: todo
    // TODO: implement build
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: settingsProviders.currentTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProviders.currentlang),
      routes: {
        Home.screenName: (_) => const Home(),
        SuraDetailScreen.suraDetailScreenName: (_) => const SuraDetailScreen(),
        HadethContent.screenName: (_) => const HadethContent(),
      },
      initialRoute: Home.screenName,
    );
  }
}
