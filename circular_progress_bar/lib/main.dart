import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeterminatePage(),
    );
  }
}

class DeterminatePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DeterminatePage({Key key}) : super(key: key);

  @override
  _DeterminatePageState createState() => _DeterminatePageState();
}

class _DeterminatePageState extends State<DeterminatePage> {
  Timer _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  // ignore: sort_constructors_first
  _DeterminatePageState() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer _timer) {
      setState(() {
        progressValue++;
        secondaryProgressValue = secondaryProgressValue + 2;
        if (progressValue == 100) {
          _timer.cancel();
        }
        if (secondaryProgressValue > 100) {
          secondaryProgressValue = 100;
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
              getNormalProgressStyle(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getFilledTrackStyle(),
                    getFilledProgressStyle()
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getThickProgressStyle(),
                    getGradientProgressStyle()
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getSemiCircleProgressStyle(),
                    getBufferProgressStyle()
                  ]),
              getSegmentedProgressStyle()
            ]));
  }

  /// Returns normal style circular progress bars.
  Widget getNormalProgressStyle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
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
                        progressValue.toStringAsFixed(0) + ' / 100',
                        style: const TextStyle(fontSize: 11),
                      ))
                ])
          ]),
        ),
        Container(
          height: 120,
          width: 120,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.05,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
                      width: 0.05,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 100,
                      animationType: AnimationType.linear)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0,
                      widget: Text(progressValue.toStringAsFixed(0) + '%'))
                ])
          ]),
        ),
      ],
    );
  }

  /// Returns filled track style circular progress bar.
  Widget getFilledTrackStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 1,
                color: const Color.fromARGB(255, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: progressValue,
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
                    widget: Text(progressValue.toStringAsFixed(0) + '%',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)))
              ])
        ]));
  }

  /// Returns filled progress style circular progress bar.
  Widget getFilledProgressStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.05,
              color: const Color.fromARGB(100, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: progressValue,
                width: 0.95,
                pointerOffset: 0.05,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationType: AnimationType.linear,
                animationDuration: 100,
              )
            ],
          )
        ]));
  }

  /// Returns gradient progress style circular progress bar.
  Widget getGradientProgressStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                color: const Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 100,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                        stops: <double>[0.25, 0.75])),
                MarkerPointer(
                  value: progressValue,
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
                    widget: Text(progressValue.toStringAsFixed(0) + '%'))
              ]),
        ]));
  }

  /// Returns thick progress style circular progress bar.
  Widget getThickProgressStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.75,
            axisLineStyle: AxisLineStyle(
              thickness: 0.05,
              color: const Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: progressValue,
                width: 0.2,
                pointerOffset: -0.08,
                enableAnimation: true,
                animationDuration: 100,
                animationType: AnimationType.linear,
                sizeUnit: GaugeSizeUnit.factor,
              )
            ],
          )
        ]));
  }

  /// Returns semi-circular style circular progress bar.
  Widget getSemiCircleProgressStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 180,
              canScaleToFit: true,
              endAngle: 0,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                color: const Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
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
                    widget: Text(progressValue.toStringAsFixed(0) + '%'))
              ]),
        ]));
  }

  /// Returns buffered style circular progress bar.
  Widget getBufferProgressStyle() {
    return Container(
        height: 120,
        width: 120,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            canScaleToFit: true,
            endAngle: 270,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.1,
              color: const Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.bothCurve,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                  value: secondaryProgressValue,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color.fromARGB(120, 0, 169, 181),
                  enableAnimation: true,
                  animationDuration: 100,
                  animationType: AnimationType.linear,
                  cornerStyle: CornerStyle.bothCurve),
              RangePointer(
                  value: progressValue,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  enableAnimation: true,
                  animationDuration: 100,
                  animationType: AnimationType.linear,
                  cornerStyle: CornerStyle.bothCurve)
            ],
          ),
        ]));
  }

  /// Returns segmented line style circular progress bar.
  Widget getSegmentedProgressStyle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 120,
            width: 120,
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
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
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
                radiusFactor: 0.8,
                majorTickStyle: MajorTickStyle(
                    length: 0.3,
                    thickness: 3,
                    lengthUnit: GaugeSizeUnit.factor,
                    color: Colors.white),
              )
            ])),
        Container(
          height: 120,
          width: 120,
          child: SfRadialGauge(axes: <RadialAxis>[
            // Create primary radial axis
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.3,
                  color: const Color.fromARGB(40, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
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
                      widget: Text(progressValue.toStringAsFixed(0) + '%'))
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
              radiusFactor: 0.8,
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
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
