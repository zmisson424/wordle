import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordle/theme/colors.dart';
import 'package:wordle/views/home/widgets/scoreboard/stats.dart';
import 'package:wordle/views/home/widgets/scoreboard/times.dart';

class ScoreboardSheet extends StatefulWidget {

  const ScoreboardSheet({
    Key? key
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScoreboardSheetState createState()=> _ScoreboardSheetState();

}

class _ScoreboardSheetState extends State<ScoreboardSheet> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children:  [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8
            ),
            child: Text(
              AppLocalizations.of(context)!.scoreboard,
              style: const TextStyle(
                fontSize: 24
              ),
            )
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey.shade200,
                  width: 0.5
                )
              )
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!.topTime,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.stats,
                ),
              ]
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TopTimes(),
                Stats()
              ]
            ),
          )
        ],
      ),
    );
  }

}