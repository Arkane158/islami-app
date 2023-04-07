import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_data_class.dart';
import 'package:islami/hadeth/hadeth_content.dart';

// ignore: must_be_immutable
class HadethTittleStyle extends StatelessWidget {
  Hadeth hadeth;

  HadethTittleStyle({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethContent.screenName,
            arguments: hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          hadeth.tittle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
