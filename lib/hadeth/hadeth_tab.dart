import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/hadeth_data_class.dart';
import 'package:islami/hadeth/hadeth_tittle_style.dart';
import 'package:islami/separator_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadith();
    }
    return Column(
      children: [
        Image.asset('assets/images/ahadeth_home.png'),
        Container(
          color: Theme.of(context).colorScheme.secondary,
          height: 2,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Container(
          color: Theme.of(context).colorScheme.secondary,
          height: 2,
        ),
        Expanded(
            child: ListView.separated(
          itemBuilder: (_, index) {
            return Container(
                alignment: Alignment.center,
                child: HadethTittleStyle(hadeth: allHadeth[index]));
          },
          separatorBuilder: (context, index) => const SeparatoBuilderWidget(),
          itemCount: allHadeth.length,
        ))
      ],
    );
  }

  void loadHadith() async {
    List<Hadeth> hadethList = [];
    String content = await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> allHadethContent = content.split('#');
    // ignore: avoid_print
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i].trim();
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String tittle = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);
      Hadeth h = Hadeth(content: content, tittle: tittle);
      hadethList.add(h);
    }
    allHadeth = hadethList;
    setState(() {});
  }
}
