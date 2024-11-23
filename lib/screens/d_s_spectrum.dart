import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DSSpectrum extends StatefulWidget {
  const DSSpectrum({super.key});

  @override
  State<DSSpectrum> createState() => _DSSpectrumState();
}

class _DSSpectrumState extends State<DSSpectrum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade100,
            Colors.deepPurple.shade200,
            Colors.deepPurple.shade300,
            Colors.deepPurple,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

          leading:InkWell(
            onTap: Navigator.of(context).pop,
            child: Platform.isIOS
              ? const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.lightGreen,
                )
              : const Icon(
                  Icons.arrow_back,
                  color: Colors.lightGreen,
                ),
          ),
          title: const Text(
            'DS Spectrum',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          forceMaterialTransparency: true,
          actions: const [
            Icon(
              Icons.bluetooth,
              color: Colors.lightGreen,
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Container(
                  margin: const EdgeInsets.all(
                    16,
                  ),
                  padding: const EdgeInsets.only(
                    right: 15,
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                    color: Colors.white,
                  ),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        show: true,
                        verticalInterval: 1,
                        drawHorizontalLine: false,
                      ),
                      lineTouchData: const LineTouchData(
                        enabled: true,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      titlesData: const FlTitlesData(
                          // show: false,
                          // leftTitles: AxisTitles(),
                          topTitles: AxisTitles(),
                          rightTitles: AxisTitles()),
                      backgroundColor: Colors.white,
                      lineBarsData: [
                        LineChartBarData(
                          dotData: const FlDotData(
                            show: false,
                          ),
                          barWidth: 6,
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade200,
                              Colors.deepPurple.shade300,
                              Colors.deepPurple.shade400,
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft,
                          ),
                          isCurved: true,
                          spots: [
                            const FlSpot(0, 0),
                            const FlSpot(1, 1),
                            const FlSpot(2, 1),
                            const FlSpot(3, 3),
                            const FlSpot(4, 3),
                            const FlSpot(5, 2),
                          ],
                        ),
                        LineChartBarData(
                            dotData: const FlDotData(
                              show: false,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.cyan.shade100,
                                Colors.cyan.shade300,
                                Colors.cyan.shade500,
                                Colors.cyan.shade600,
                              ],
                              end: Alignment.centerRight,
                              begin: Alignment.centerLeft,
                            ),
                            show: true,
                            barWidth: 6,
                            isCurved: true,
                            spots: [
                              const FlSpot(0, 2),
                              const FlSpot(1, 2),
                              const FlSpot(2, 3),
                              const FlSpot(3, 4),
                              const FlSpot(4, 5),
                              const FlSpot(5, 4),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              margin: const EdgeInsets.all(
                20,
              ),
              padding: const EdgeInsets.all(
                15,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Spectrum Capture',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_view_month,
                    color: Colors.lightGreen,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              margin: const EdgeInsets.all(
                20,
              ),
              padding: const EdgeInsets.all(
                15,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Last Updated Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.autorenew_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
