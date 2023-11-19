import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartStockPage extends StatelessWidget {
  const LineChartStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(1, 1),
              const FlSpot(2, 4),
              const FlSpot(3, 2),
            ],
            isCurved: true,
            // colors: [Colors.blue],
            color: Colors.green,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Color.fromRGBO(16, 105, 16, 0.294),
                ],
              ),
            ),
          ),
        ],
        titlesData:  FlTitlesData(
            // show: false,
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget:(value, meta) {
                // return Text("dafj");
                switch (value.toInt()) {
                  case 1:
                    return const Text("april");
                    // break;
                  default:
                  return const Text("data");
                }
              },
            ))
            // bottomTitles: SideTitles(
            //     showTitles: true,
            //     getTitlesWidget: (value) {
            //       switch (value.toInt()) {
            //         case 2:
            //           return '';
            //         // break;
            //         default:
            //       }
            //     }),
            ),
      ),
    );
  }
}
