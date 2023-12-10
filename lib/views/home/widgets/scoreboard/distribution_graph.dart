import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/cubit/stats_cubit.dart';
import '../../../../theme/colors.dart';

class DistributionGraph extends StatelessWidget {

  const DistributionGraph({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distributions = context.watch<StatsCubit>().state.winDistribution;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Distribution',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600
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
                barGroups: _createBarChart(distributions),
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
                          value.toStringAsFixed(1),
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
    );
  }


  List<BarChartGroupData> _createBarChart(List<int> distributions){
    List<BarChartGroupData> results = [];

    for(int x = 0; x < distributions.length; x++){
      results.add(
        BarChartGroupData(
          x: x + 1,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: distributions[x].toDouble(),
              color: AppColors.primary,
              width: 32,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            ),
          ]
        )
      );
    }
    return results;
  }
}