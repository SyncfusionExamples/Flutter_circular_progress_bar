import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  // Register your license here
  // SyncfusionLicense.registerLicense(null);
  return runApp(GaugeApp());
}

class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Progress bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  double _value1 = 5;
  double _value2 = 1;
  double _value3 = 1;
  double _value4 = 1;

  // ignore: sort_constructors_first
  _MyHomePageState() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer _timer) {
      setState(() {
        _value1++;
        _value2++;
        _value3++;
        _value4++;
        if (_value1 > 100) {
          _value1 = 100;
        }
        if (_value2 > 100) {
          _value2 = 0;
        }
        if (_value3 > 4) {
          _value3 = 0;
        }
        if (_value4 > 20) {
          _value4 = 0;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Flutter circular progress bar')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          showLabels: false,
                          showTicks: false,
                          radiusFactor: 0.7,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.2,
                            cornerStyle: CornerStyle.bothCurve,
                            color: const Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: _value1,
                                cornerStyle: CornerStyle.bothCurve,
                                width: 0.2,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 500,
                                animationType: AnimationType.linear)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                positionFactor: 0.1,
                                angle: 90,
                                widget: Text(
                                  _value1.toStringAsFixed(0) + ' / 100',
                                  style: const TextStyle(fontSize: 11),
                                ))
                          ])
                    ]),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.7,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.05,
                            color: const Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: _value2,
                                width: 0.05,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 500,
                                animationType: AnimationType.linear)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                positionFactor: 0,
                                widget: Text(_value2.toStringAsFixed(0) + '%'))
                          ])
                    ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 150,
                      width: 150,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 4,
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.7,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.05,
                            color: const Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: _value3,
                                width: 0.2,
                                pointerOffset: -0.08,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 500,
                                animationType: AnimationType.linear)
                          ],
                        )
                      ])),
                  Container(
                      height: 150,
                      width: 150,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 4,
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.7,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.05,
                            color: const Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: _value3,
                                width: 1,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 500,
                                animationType: AnimationType.linear)
                          ],
                        )
                      ])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 150,
                      width: 150,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        // Create primary radial axis
                        RadialAxis(
                          minimum: 0,
                          interval: 1,
                          maximum: 4,
                          showLabels: false,
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.7,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.2,
                            color: const Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: _value3,
                                width: 0.05,
                                pointerOffset: 0.07,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 500,
                                animationType: AnimationType.linear)
                          ],
                        ),
                        // Create secondary radial axis for segmented line
                        RadialAxis(
                          minimum: 0,
                          interval: 1,
                          maximum: 4,
                          showLabels: false,
                          showTicks: true,
                          showAxisLine: false,
                          tickOffset: -0.05,
                          offsetUnit: GaugeSizeUnit.factor,
                          minorTicksPerInterval: 0,
                          startAngle: 270,
                          endAngle: 270,
                          radiusFactor: 0.7,
                          majorTickStyle: MajorTickStyle(
                              length: 0.3,
                              thickness: 3,
                              lengthUnit: GaugeSizeUnit.factor,
                              color: Colors.white),
                        )
                      ])),
                  Container(
                    height: 150,
                    width: 150,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      // Create primary radial axis
                      RadialAxis(
                        minimum: 0,
                        interval: 1,
                        maximum: 20,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: 0.7,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.05,
                          color: const Color.fromARGB(40, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _value4,
                              width: 0.05,
                              sizeUnit: GaugeSizeUnit.factor,
                              enableAnimation: false,
                              animationDuration: 1000,
                              animationType: AnimationType.linear)
                        ],
                      ),
                      // Create secondary radial axis for segmented line
                      RadialAxis(
                        minimum: 0,
                        interval: 1,
                        maximum: 20,
                        showLabels: false,
                        showTicks: true,
                        showAxisLine: false,
                        tickOffset: -0.05,
                        offsetUnit: GaugeSizeUnit.factor,
                        minorTicksPerInterval: 0,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: 0.7,
                        majorTickStyle: MajorTickStyle(
                            length: 0.1,
                            thickness: 5,
                            lengthUnit: GaugeSizeUnit.factor,
                            color: Colors.white),
                      )
                    ]),
                  )
                ],
              )
            ]));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
