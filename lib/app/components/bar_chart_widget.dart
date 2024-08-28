
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 80,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: 120,
            width: Get.width * 2,
            child: IgnorePointer(
              ignoring: true,
              child: BarChart(
                BarChartData(
                  // groupsSpace: 10,
                  rangeAnnotations: RangeAnnotations(),
                  titlesData: FlTitlesData(
                      leftTitles: AxisTitles(),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (val, meta) {
                              return SideTitleWidget(
                                  child: Text(
                                    "${val.toInt().toString().padLeft(2, "0")}:00",
                                    style: TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                  axisSide: AxisSide.bottom);
                            },
                          ))),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    ...barChartMockedData(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<BarChartGroupData> barChartMockedData() {
  return List.generate(
    10,
        (index) => BarChartGroupData(x: index + 10, barsSpace: 10, showingTooltipIndicators: [], barRods: [
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 10.0, width: 2.0, color: Colors.red),
      BarChartRodData(toY: 5.0, width: 2.0, color: Colors.red),
      BarChartRodData(toY: 5.0, width: 2.0, color: Colors.red),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey),
      BarChartRodData(toY: 0.1, width: 2.0, color: Colors.grey)
    ]),
  );
}