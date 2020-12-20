import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:provider/provider.dart';
// import '../data/stats_data.dart';
// import 'package:intl/intl.dart';

class ShowGraph extends StatefulWidget {
  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph> {
  List data = [];

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) {
  //     var _statsData = Provider.of<StatsData>(context);
  //     _statsData.setGraphData();
  //     data = _statsData.monthlydata;
  //   });
  //   super.initState();
  // }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 3),
        FlSpot(2, 4),
        FlSpot(3, 1.5),
        FlSpot(4, 2.2),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(11, 1.8),
        FlSpot(12, 3),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 2.5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: true, colors: [
        Colors.blueAccent.withOpacity(0.1),
        Colors.blue.withOpacity(0.4),
        Colors.greenAccent.withOpacity(0.3),
      ]),
    );
    return [
      lineChartBarData1,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
          ),
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1,
          drawHorizontalLine: true,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff72719b),
              fontWeight: FontWeight.bold,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return 'Feb';
                case 4:
                  return 'April';
                case 6:
                  return 'June';
                case 8:
                  return 'Aug';
                case 10:
                  return 'Oct';
                case 12:
                  return 'Dec';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff75729e),
              fontWeight: FontWeight.bold,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '1m';
                case 2:
                  return '2m';
                case 3:
                  return '3m';
                case 4:
                  return '4m';
              }
              return '';
            },
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 1,
        maxX: 12,
        maxY: 5,
        minY: 0,
        lineBarsData: linesBarData1(),
      ),
    );
  }
}
