import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';

class StatisticsTable extends StatefulWidget {
  const StatisticsTable({super.key});

  @override
  State<StatisticsTable> createState() => _StatisticsTableState();
}

class _StatisticsTableState extends State<StatisticsTable> {
  String selectedTrend = "5D";

  final Map<String, List<Map<String, dynamic>>> trendDataMap = {
    "1D": [
      {"date": "13 Aug", "rate": 1060},
      {"date": "13 Aug", "rate": 1058},
      {"date": "13 Aug", "rate": 1062},
    ],
    "5D": [
      {"date": "6 Dec", "rate": 1060},
      {"date": "7 Dec", "rate": 1055},
      {"date": "8 Dec", "rate": 1065},
      {"date": "9 Dec", "rate": 1056},
      {"date": "10 Dec", "rate": 1060},
    ],
    "1M": [
      {"date": "10 Jul", "rate": 1040},
      {"date": "15 Jul", "rate": 1050},
      {"date": "20 Jul", "rate": 1060},
      {"date": "25 Jul", "rate": 1055},
    ],
    "1Y": [
      {"date": "Jan", "rate": 980},
      {"date": "Apr", "rate": 1020},
      {"date": "Aug", "rate": 1060},
    ],
    "5Y": [
      {"date": "2021", "rate": 900},
      {"date": "2022", "rate": 950},
      {"date": "2023", "rate": 1020},
      {"date": "2024", "rate": 1060},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final trendData = trendDataMap[selectedTrend]!;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(12.dp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["1D", "5D", "1M", "1Y", "5Y"].map((trend) {
              final isSelected = trend == selectedTrend;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTrend = trend;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.grey.shade800
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    trend,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Gap(16.dp),

          Container(
            height: 250.dp,
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade800, width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Date",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rate",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...trendData.map((row) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  row["date"].toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  row["rate"].toString(),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
