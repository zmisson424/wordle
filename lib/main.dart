import 'package:flutter/material.dart';
import 'package:wordle/theme/dark_theme.dart';
import 'package:wordle/theme/light_theme.dart';
import 'package:wordle/views/home/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const WordleApp());
}

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', '')
      ],
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeView(),
    );
  }
}
