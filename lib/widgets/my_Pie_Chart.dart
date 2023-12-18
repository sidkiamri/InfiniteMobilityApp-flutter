import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyDoughnutChart extends StatelessWidget {
  final double pvContribution; // Solar Pv contribution
  final double chargerContribution; // Charger contribution

  const MyDoughnutChart({
    Key? key,
    required this.pvContribution,
    required this.chargerContribution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Solar Pv contribution', pvContribution),
      ChartData('Charger contribution', chargerContribution),
    ];

    return SfCircularChart(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      palette: const [kAccentBlue, kAccentRed],
      series: <CircularSeries>[
        // Renders doughnut chart
        DoughnutSeries<ChartData, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          innerRadius:
              '60%', // Adjust this value to set the size of the doughnut hole
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
