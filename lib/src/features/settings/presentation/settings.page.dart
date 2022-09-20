import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/core/extensions/localization.extension.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _LanguageCard(title: context.loc.german, languageCode: 'de'),
            _LanguageCard(title: context.loc.english, languageCode: 'en'),
          ],
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    Key? key,
    required this.title,
    this.languageCode = 'de',
  }) : super(key: key);

  final String title;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => App.of(context).setLocale(Locale.fromSubtags(languageCode: languageCode)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 18, fontWeight: context.languageCode == languageCode ? FontWeight.bold : null),
          ),
        ),
      ),
    );
  }
}
