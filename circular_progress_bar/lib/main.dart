import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  // Register your license here
  // SyncfusionLicense.registerLicense(null);
  runApp(MaterialApp(
    title: 'Flutter Circular Progress bar',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Progress bar'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            child: const Text('Determinate Progress bar'),
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                // ignore: always_specify_types
                MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => DeterminatePage()),
              );
            },
          ),
          RaisedButton(
            child: const Text('Indeterminate Progress bar'),
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                // ignore: always_specify_types
                MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => IndeterminatePage()),
              );
            },
          )
        ],
      )),
    );
  }
}

class DeterminatePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DeterminatePage({Key key}) : super(key: key);

  @override
  _DeterminateState createState() => _DeterminateState();
}

class _DeterminateState extends State<DeterminatePage>
    with TickerProviderStateMixin {
  Timer _timer;
  double _value1 = 0;
  double _value2 = 0;

  // ignore: sort_constructors_first
  _DeterminateState() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer _timer) {
      setState(() {
        _value1++;
        _value2++;
        if (_value1 > 100) {
          _value1 = 100;
          _timer.cancel();
        }
        if (_value2 > 75) {
          _value2 = 75;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Flutter circular progress bar')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
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
                            animationDuration: 100,
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
                            value: _value1,
                            width: 0.05,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
                            animationType: AnimationType.linear)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0,
                            widget: Text(_value1.toStringAsFixed(0) + '%'))
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
                          width: 0.2,
                          pointerOffset: -0.08,
                          enableAnimation: true,
                          animationDuration: 100,
                          animationType: AnimationType.linear,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                    )
                  ])),
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
                          thickness: 1,
                          color: const Color.fromARGB(255, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: _value2,
                            width: 0.15,
                            enableAnimation: true,
                            animationDuration: 100,
                            color: Colors.white,
                            pointerOffset: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            animationType: AnimationType.linear,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              positionFactor: 0.5,
                              widget: Text(_value2.toStringAsFixed(0) + '%',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))
                        ])
                  ])),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                height: 150,
                width: 150,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      startAngle: 180,
                      canScaleToFit: true,
                      endAngle: 0,
                      radiusFactor: 0.7,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.1,
                        color: const Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.startCurve,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: _value2,
                            width: 0.1,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
                            animationType: AnimationType.linear,
                            cornerStyle: CornerStyle.startCurve)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0,
                            widget: Text(_value2.toStringAsFixed(0) + '%'))
                      ]),
                ])),
            Container(
                height: 150,
                width: 150,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      startAngle: 270,
                      endAngle: 270,
                      radiusFactor: 0.7,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.1,
                        color: const Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.startCurve,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: _value2,
                            width: 0.1,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
                            animationType: AnimationType.linear,
                            cornerStyle: CornerStyle.startCurve,
                            gradient: const SweepGradient(colors: <Color>[
                              Color(0xFF00a9b5),
                              Color(0xFFa4edeb)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                          value: _value2,
                          markerType: MarkerType.circle,
                          enableAnimation: true,
                          animationDuration: 100,
                          animationType: AnimationType.linear,
                          color: const Color(0xFF87e8e8),
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0,
                            widget: Text(_value2.toStringAsFixed(0) + '%'))
                      ]),
                ])),
          ]),
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
                      maximum: 100,
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
                            value: _value1,
                            width: 0.05,
                            pointerOffset: 0.07,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
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
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.7,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.3,
                        color: const Color.fromARGB(40, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: _value1,
                            width: 0.3,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
                            animationType: AnimationType.linear)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.2,
                            horizontalAlignment: GaugeAlignment.center,
                            widget: Text(_value1.toStringAsFixed(0) + '%'))
                      ]),
                  // Create secondary radial axis for segmented line
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    showAxisLine: true,
                    tickOffset: -0.05,
                    offsetUnit: GaugeSizeUnit.factor,
                    minorTicksPerInterval: 0,
                    radiusFactor: 0.7,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.3,
                      color: Colors.white,
                      dashArray: <double>[4, 3],
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                  )
                ]),
              ),
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

class IndeterminatePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  IndeterminatePage({Key key}) : super(key: key);

  @override
  _IndeterminateState createState() => _IndeterminateState();
}

class _IndeterminateState extends State<IndeterminatePage>
    with TickerProviderStateMixin {
  // ignore: sort_constructors_first
  _IndeterminateState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Flutter circular progress bar')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Container()]));
  }
}
