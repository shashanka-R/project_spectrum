import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:project_spectrum/screens/d_s_spectrum.dart';
import 'package:project_spectrum/screens/diagnostic_screen.dart';
import 'package:project_spectrum/screens/status_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const double borderRadius = 25.0;

class CustomSwitchState extends StatefulWidget {
  @override
  _CustomSwitchStateState createState() => _CustomSwitchStateState();
}

class _CustomSwitchStateState extends State<CustomSwitchState>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

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
          toolbarHeight: 0,
          backgroundColor: Colors.deepPurple,
          forceMaterialTransparency: true,
          actions: const [
            Icon(
              Icons.bluetooth,
              color: Colors.lightGreen,
            ),
          ],
        ),
        body: SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _menuBar(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    // flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(
                          () {
                            activePageIndex = i;
                          },
                        );
                      },
                      children: <Widget>[
                        ListView(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const DSSpectrum(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade300,
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
                                child: const Text(
                                  'Start Auto Alignment',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: AspectRatio(
                                aspectRatio: 1.8,
                                child: Container(
                                  margin: const EdgeInsets.all(
                                    16,
                                  ),
                                  padding: const EdgeInsets.all(
                                    15,
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
                                        show: false,
                                        leftTitles: AxisTitles(),
                                      ),
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const StatusScreen(),
                                  ),
                                );
                              },
                              child: Container(
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Text(
                                      'Capture Spectrum',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/images/icons8-pulse-30.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  6,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Amplifier Interesting Values',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.cyan.shade600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Input Stage',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: DottedBorder(
                                              radius: const Radius.circular(
                                                20,
                                              ),
                                              padding: const EdgeInsets.all(
                                                10,
                                              ),
                                              borderType: BorderType.RRect,
                                              color: Colors.black26,
                                              strokeWidth: 1,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Equ-1',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                      color: Colors.lightBlue,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '1.23',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Attn-1',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                      color: Colors
                                                          .indigo.shade200,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '0.223',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        color: Colors.grey,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Intermediate Stage',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: DottedBorder(
                                              radius: const Radius.circular(
                                                20,
                                              ),
                                              padding: const EdgeInsets.all(
                                                10,
                                              ),
                                              borderType: BorderType.RRect,
                                              color: Colors.black26,
                                              strokeWidth: 1,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Equ-2',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                      color: Colors.lightBlue,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '1.23',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Attn-2',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                      color: Colors
                                                          .indigo.shade200,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '0.223',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Output Stage',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: DottedBorder(
                                              radius: const Radius.circular(
                                                20,
                                              ),
                                              padding: const EdgeInsets.all(
                                                10,
                                              ),
                                              borderType: BorderType.RRect,
                                              color: Colors.black26,
                                              strokeWidth: 1,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Equ-3',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                      color: Colors.lightBlue,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '1.23',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        6,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.cyan.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Disabled',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InputQty(
                                        decoration: QtyDecorationProps(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          // plusBtn: Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(
                                          //       4,
                                          //     ),
                                          //     color: Colors.green,
                                          //   ),
                                          //   width: 24,
                                          //   height: 24,
                                          //   child: Text(
                                          //     '+',
                                          //     style: TextStyle(
                                          //       fontSize: 16,
                                          //     ),
                                          //   ),
                                          //   alignment: Alignment.center,
                                          // ),
                                        ),
                                        maxVal: 100,
                                        initVal: 0,
                                        minVal: 0,
                                        steps: 1,
                                        onQtyChanged: (val) {
                                          print(val);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DiagnosticScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade300,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Save',
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
                                            Icons.check,
                                            color: Colors.lightGreen,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade300,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Revert',
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
                                          Icons
                                              .subdirectory_arrow_left_outlined,
                                          color: Colors.lightGreen,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: const Center(
                            child: Text(
                              "Coming soon...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      // width: 300.0,
      height: 50.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onPlaceBidButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 0)
                    ? BoxDecoration(
                        color: Colors.lightGreen[300],
                        borderRadius: const BorderRadius.all(
                            Radius.circular(borderRadius)),
                      )
                    : null,
                child: Text(
                  "Auto",
                  style: (activePageIndex == 0)
                      ? const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)
                      : const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onBuyNowButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 1)
                    ? BoxDecoration(
                        color: Colors.lightGreen[300],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            borderRadius,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  "Manuel",
                  style: (activePageIndex == 1)
                      ? const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
