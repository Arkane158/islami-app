import 'package:flutter/material.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:provider/provider.dart';

import 'hadeth_data_class.dart';


class HadethContent extends StatelessWidget {
  static const String screenName = "HadethContent";
  const HadethContent({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.currentTheme == ThemeMode.light
                  ? 'assets/images/bg3.png'
                  : 'assets/images/bg3_dark.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.tittle),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            elevation: 12,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.content,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
