// ignore_for_file: must_be_immutable
import 'package:expenses_app/utils/random.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  bool isCircular;
  Graph({super.key, required this.isCircular});

  @override
  Widget build(BuildContext context) {
    RandomGenerator randomGenerator = RandomGenerator();
    var color = Theme.of(context).colorScheme;

    List<PieChartSectionData> sectionData = List.generate(10, (index) {
      return PieChartSectionData(
        value: randomGenerator.getDouble(0, 100),
        showTitle: false,
        color: color.primary,
      );
    });

    List<FlSpot> linePoints = List.generate(30, (index) {
      return FlSpot(index + 1, randomGenerator.getDouble(0, 1500));
    });

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      String text;
      switch (value.toInt()) {
        case 500:
          text = '\$ 500';
          break;
        case 1000:
          text = '\$ 1000';
          break;
        case 1500:
          text = '\$ 1500';
          break;
        default:
          return Container();
      }
      return Text(text);
    }

    LineChartData linesData = LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: 200,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: color.secondary.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: color.primary,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 5,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: leftTitleWidgets,
            showTitles: true,
            interval: 2,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 1,
      maxX: 30,
      minY: 0,
      maxY: 1500,
      lineBarsData: [
        LineChartBarData(
          spots: linePoints,
          isCurved: true,
          color: color.primary,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: !isCircular
            ? LineChart(
                linesData,
              )
            : PieChart(
                PieChartData(
                  sections: sectionData,
                ),
              ),
      ),
    );
  }
}
