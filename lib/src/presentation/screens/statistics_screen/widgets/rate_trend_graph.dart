import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class RateTrendGraph extends StatelessWidget {
  const RateTrendGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.dp,
      decoration: BoxDecoration(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.dp,vertical: 16 .dp),
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.transparent,
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    if (value % 5 == 0) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 1:
                        return const Text("6 Dec",
                            style: TextStyle(color: Colors.grey, fontSize: 12));
                      case 2:
                        return const Text("8 Dec",
                            style: TextStyle(color: Colors.grey, fontSize: 12));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Colors.white, width: 1),
                left: BorderSide(color: Colors.white, width: 1),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            minX: 0,
            maxX: 3,
            minY: 1050,
            maxY: 1065,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 1060),
                  FlSpot(0.5, 1055),
                  FlSpot(1, 1062),
                  FlSpot(1.5, 1065),
                  FlSpot(2, 1056),
                  FlSpot(2.5, 1060),
                ],
                isCurved: false,
                color: Colors.green,
                barWidth: 2,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.4),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                dotData: FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
