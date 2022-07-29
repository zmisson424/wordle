import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wordle/theme/colors.dart';

class Stats extends StatelessWidget {

  const Stats({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 24
            ),
            child: Row(
              children: const [
                _StatBlock(
                  title: 'Games Won', 
                  stat: '12'
                ),
                _StatBlock(
                  title: 'Games Played', 
                  stat: '14'
                ),
                _StatBlock(
                  title: 'Current Streak', 
                  stat: '2'
                ),
                _StatBlock(
                  title: 'Best Streak', 
                  stat: '4'
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 24,
              left: 24,
              right: 24
            ),
            width: double.infinity,
            height: 300,
            child: SfCartesianChart(
              title: ChartTitle(
                text: 'Distribution'
              ),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              series: <ChartSeries<_ChartData, String>>[
                BarSeries<_ChartData, String>(
                  dataSource: [
                    _ChartData('5', 7),
                    _ChartData('4', 10),
                    _ChartData('3', 8),
                    _ChartData('2', 2),
                    _ChartData('1', 1),
                  ], 
                  xValueMapper: (_ChartData data, _) => data.x, 
                  yValueMapper: (_ChartData data, _) => data.y,
                  color: AppColors.primary
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {

  const _StatBlock({
    Key? key,
    required this.title,
    required this.stat
  }) : super(key: key);

  final String title;

  final String stat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stat,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;

  _ChartData(this.x, this.y);
}