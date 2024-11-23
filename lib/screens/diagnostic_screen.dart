import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({super.key});

  @override
  State<DiagnosticScreen> createState() => _DiagnosticScreenState();
}

class _DiagnosticScreenState extends State<DiagnosticScreen> {
  double dbValue = 0.0;

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
          leading: InkWell(
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
            'Diagnostic',
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
            Container(
              margin: const EdgeInsets.all(
                10,
              ),
              padding: const EdgeInsets.only(
                right: 10,
                top: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  6,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                      top: 10,
                    ),
                    child: Text(
                      'Ingress Switch',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Slider(
                    // thumbColor: Colors.white,
                    label: '-${dbValue}db',
                    value: dbValue,
                    divisions: 10,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        dbValue = value;
                      });
                    },
                    min: 0,
                    max: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0db'),
                        Text('-30db'),
                      ],
                    ),
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
