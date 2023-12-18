import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SolarData {
  final String hour;
  final double kilowattProduced;

  SolarData(this.hour, this.kilowattProduced);
}

Widget buildBarChart() {
  return Container(
    height: 250,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 800,
        child: SfCartesianChart(
          enableAxisAnimation: true,
          primaryXAxis: CategoryAxis(
            title: AxisTitle(text: 'Time'),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Kilowatt'),
            maximum: 15,
          ),
          series: <ChartSeries>[
            ColumnSeries<SolarData, String>(
              dataSource: [
                SolarData('05:00', 2),
                SolarData('06:00', 3),
                SolarData('07:00', 9),
                SolarData('8:00', 6),
                SolarData('9:00', 7.5),
                SolarData('10:00', 6.5),
                SolarData('11:00', 8),
                SolarData('12:00', 10),
                SolarData('13:00', 11),
                SolarData('14:00', 8.8),
                SolarData('15:00', 6.3),
                SolarData('16:00', 9),
                SolarData('17:00', 5),
                SolarData('18:00', 1.9),
                SolarData('19:00', 0.8),
                SolarData('20:00', 0.4),
                // Add more data here...
              ],
              xValueMapper: (SolarData data, _) => data.hour,
              yValueMapper: (SolarData data, _) => data.kilowattProduced,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              spacing: 0.78,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kAccentRed, kAccentBlue], // Set the colors here
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
