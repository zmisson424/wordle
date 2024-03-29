import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordle/bloc/cubit/stats_cubit.dart';
import 'package:wordle/views/home/widgets/scoreboard/index.dart';

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
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: ((context) => BlocProvider(
                create: (context) => StatsCubit()..fetchStats(),
                child: const ScoreboardSheet(),
              ))
            );
          },
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