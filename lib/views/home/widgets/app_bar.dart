import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordleAppBar extends StatelessWidget implements PreferredSizeWidget {

  const WordleAppBar({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.appTitle
      ),
      actions: [
        IconButton(
          onPressed: () => print('TODO'),
          icon: const Icon(
            Icons.help_outline
          ),
        ),
        IconButton(
          onPressed: () => print('TODO'),
          icon: const Icon(
            Icons.leaderboard_outlined
          ),
        ),
        IconButton(
          onPressed: () => print('TODO'),
          icon: const Icon(
            Icons.settings_outlined
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}