import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ShowGraph extends StatefulWidget {
  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph> {
  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc)
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      // lineChartBarData3,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: LineChart(
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
          ),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              // reservedSize: 22,
              getTextStyles: (value) => const TextStyle(
                color: Color(0xff72719b),
                fontWeight: FontWeight.bold,
                // fontSize: 10,
              ),
              // margin: 3,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return 'SEPT';
                  case 7:
                    return 'OCT';
                  case 12:
                    return 'DEC';
                }
                return '';
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) => const TextStyle(
                color: Color(0xff75729e),
                fontWeight: FontWeight.bold,
                // fontSize: 14,
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
              // margin: 3,
              // reservedSize: 30,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(
                color: Color(0xff4e4965),
                // width: 4,
              ),
              left: BorderSide(
                color: Colors.transparent,
              ),
              right: BorderSide(
                color: Colors.transparent,
              ),
              top: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
          minX: 0,
          maxX: 14,
          maxY: 4,
          minY: 0,
          lineBarsData: linesBarData1(),
        ),
      ),
    );
  }
}
