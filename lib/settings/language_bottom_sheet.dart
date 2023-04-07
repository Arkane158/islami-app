import 'package:flutter/material.dart';
import 'package:islami/providers/settings_providers.dart';
import 'package:provider/provider.dart';

class LanguaeBottomSheet extends StatefulWidget {
  const LanguaeBottomSheet({super.key});

  @override
  State<LanguaeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<LanguaeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLocal('en');
              },
              child: settingsProvider.isEn()
                  ? getSelectedItem("English")
                  : getUnSelectedItem("English")),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLocal('ar');
              },
              child: settingsProvider.isEn()
                  ? getUnSelectedItem('العربية')
                  : getSelectedItem('العربية'))
        ],
      ),
    );
  }

  Widget getSelectedItem(String tittle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tittle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String tittle) {
    return Text(
      tittle,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
