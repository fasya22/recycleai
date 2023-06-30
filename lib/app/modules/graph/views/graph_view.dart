import 'package:recycleai/model/sampah.dart';
import 'package:recycleai/theme/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/graph_controller.dart';

class GraphView extends GetView<GraphController> {
  const GraphView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GraphController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 500),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },
          child: Text(
            'Visualization',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(right: 12),
                height: 200,
                child: BarChart(
                  BarChartData(
                      barGroups: controller.data
                          .map(
                            (DataSampah e) => BarChartGroupData(
                              x: controller.data.indexOf(e) + 1,
                              barRods: [
                                BarChartRodData(
                                  toY: double.parse(e.plastic ?? '0.0'),
                                  color: Colors.red,
                                ),
                                BarChartRodData(
                                  toY: double.parse(e.glass ?? '0.0'),
                                  color: Colors.blue,
                                ),
                                BarChartRodData(
                                  toY: double.parse(e.metal ?? '0.0'),
                                  color: Colors.yellow,
                                ),
                                BarChartRodData(
                                  toY: double.parse(e.paper ?? '0.0'),
                                  color: Colors.blueGrey,
                                ),
                                BarChartRodData(
                                  toY: double.parse(e.ewaste ?? '0.0'),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                      groupsSpace: 4,
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
                            reservedSize: 28,
                            interval: 1,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                      )),
                  swapAnimationDuration: const Duration(milliseconds: 150),
                  swapAnimationCurve: Curves.linear,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text('Plastic'),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 20,
                    height: 20,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text('Glass'),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 20,
                    height: 20,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  Text('Metal'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 20,
                    height: 20,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(width: 10),
                  Text('Paper'),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 20,
                    height: 20,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text('e-waste'),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    DateFormat inputFormat = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'");
    DateTime date =
        inputFormat.parse(controller.data[value.toInt() - 1].createdAt ?? '');

    DateFormat outputFormat = DateFormat("dd MM yyyy");
    String formattedDate = outputFormat.format(date);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(
        formattedDate,
        maxLines: 2,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 11,
        ),
      ),
    );
  }
}
