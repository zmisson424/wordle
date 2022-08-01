import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
              top: 12,
              bottom: 12
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
              left: 36,
              right: 36
            ),
            width: double.infinity,
            height: 274,
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 1,
                        color: AppColors.primary,
                        width: 32,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ]
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 5,
                        color: AppColors.primary,
                        width: 32,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ]
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 9,
                        color: AppColors.primary,
                        width: 32,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ]
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 12,
                        color: AppColors.primary,
                        width: 32,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ]
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 8,
                        color: AppColors.primary,
                        width: 32,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      ),
                    ]
                  ),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false
                    )
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                    )
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    )
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Colors.blueGrey.shade500,
                    width: 1
                  )
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFececec),
                    dashArray: null,
                    strokeWidth: 1,
                  ),
                ),
              ),
              swapAnimationDuration: const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
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