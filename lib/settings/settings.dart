import 'package:flutter/material.dart';
import 'package:islami/settings/language_bottom_sheet.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/settings_providers.dart';

class Settings extends StatefulWidget {
  static const String screenName = "settings";

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            (AppLocalizations.of(context)!.theme),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1)),
              child: Text(
                settingsProvider.isDarkMode()
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            (AppLocalizations.of(context)!.language),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLocalBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1)),
              child: Text(
                settingsProvider.isEn() ? "English" : "العربية",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const ThemeBottomSheet();
        });
  }

  void showLocalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const LanguaeBottomSheet();
        });
  }
}
