import 'package:flutter/material.dart';
import 'package:ruler_slider/ruler_slider.dart';

void main() {
  runApp(const RulerSliderDemoApp());
}

class RulerSliderDemoApp extends StatelessWidget {
  const RulerSliderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RulerSliderDemo(),
    );
  }
}

class RulerSliderDemo extends StatefulWidget {
  @override
  _RulerSliderDemoState createState() => _RulerSliderDemoState();
}

class _RulerSliderDemoState extends State<RulerSliderDemo> {
  double minValue = 0.0;
  double maxValue = 100.0;
  double initialValue = 50.0;
  double rulerWidth = 300.0;
  double rulerHeight = 100.0;
  double tickSpacing = 10.0;
  double scrollSensitivity = 1.0;
  bool showFixedBar = true;
  bool showFixedLabel = true;
  bool enableSnapping = false;
  int majorTickInterval = 5;
  int labelInterval = 10;
  double labelVerticalOffset = 25.0;
  bool showBottomLabels = true;
  double majorTickHeight = 20.0;
  double minorTickHeight = 10.0;
  String selectedColor = 'Blue';
  String selectedLabelColor = 'Black';

  final List<String> colors = ['Blue', 'Red', 'Green', 'Yellow'];
  final List<String> labelColors = ['Black', 'Red', 'Blue', 'Green'];
  final Map<String, Color> colorMap = {
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };
  final Map<String, Color> labelColorMap = {
    'Black': Colors.black,
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
  };

  final List<String> customLabels = [
    'Start', '10', '20', '30', '40', 'Mid', '60', '70', '80', '90', 'End'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RulerSlider Full Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display the RulerSlider with all dynamic values
              RulerSlider(
                minValue: minValue,
                maxValue: maxValue,
                initialValue: initialValue,
                rulerWidth: rulerWidth,
                rulerHeight: rulerHeight,
                selectedBarColor: colorMap[selectedColor]!,
                unselectedBarColor: Colors.grey,
                tickSpacing: tickSpacing,
                showFixedBar: showFixedBar,
                fixedBarColor: Colors.red,
                fixedBarWidth: 2.0,
                fixedBarHeight: 40.0,
                showFixedLabel: showFixedLabel,
                fixedLabelColor: Colors.red,
                scrollSensitivity: scrollSensitivity,
                enableSnapping: enableSnapping,
                majorTickInterval: majorTickInterval,
                labelInterval: labelInterval,
                labelVerticalOffset: labelVerticalOffset,
                showBottomLabels: showBottomLabels,
                labelTextStyle: TextStyle(
                  color: labelColorMap[selectedLabelColor]!,
                  fontSize: 12,
                ),
                majorTickHeight: majorTickHeight,
                minorTickHeight: minorTickHeight,
                customLabels: customLabels,
                onChanged: (value) {
                  setState(() {
                    initialValue = value;
                  });
                },
              ),
              Divider(),
              // Controls to dynamically change properties
              Text('Adjust RulerSlider Features:'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tick Spacing: ${tickSpacing.toStringAsFixed(1)}'),
                  Slider(
                    value: tickSpacing,
                    min: 5,
                    max: 30,
                    onChanged: (value) {
                      setState(() {
                        tickSpacing = value;
                      });
                    },
                  ),
                ],
              ),
              DropdownButton<String>(
                value: selectedColor,
                items: colors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newColor) {
                  setState(() {
                    selectedColor = newColor!;
                  });
                },
                hint: Text("Select Bar Color"),
              ),
              DropdownButton<String>(
                value: selectedLabelColor,
                items: labelColors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newColor) {
                  setState(() {
                    selectedLabelColor = newColor!;
                  });
                },
                hint: Text("Select Label Color"),
              ),
              SwitchListTile(
                title: Text('Show Fixed Bar'),
                value: showFixedBar,
                onChanged: (value) {
                  setState(() {
                    showFixedBar = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Show Fixed Label'),
                value: showFixedLabel,
                onChanged: (value) {
                  setState(() {
                    showFixedLabel = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Enable Snapping'),
                value: enableSnapping,
                onChanged: (value) {
                  setState(() {
                    enableSnapping = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Show Bottom Labels'),
                value: showBottomLabels,
                onChanged: (value) {
                  setState(() {
                    showBottomLabels = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Scroll Sensitivity: ${scrollSensitivity.toStringAsFixed(1)}'),
                  Slider(
                    value: scrollSensitivity,
                    min: 0.1,
                    max: 5.0,
                    onChanged: (value) {
                      setState(() {
                        scrollSensitivity = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Major Tick Height: ${majorTickHeight.toStringAsFixed(1)}'),
                  Slider(
                    value: majorTickHeight,
                    min: 10.0,
                    max: 40.0,
                    onChanged: (value) {
                      setState(() {
                        majorTickHeight = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Minor Tick Height: ${minorTickHeight.toStringAsFixed(1)}'),
                  Slider(
                    value: minorTickHeight,
                    min: 5.0,
                    max: 20.0,
                    onChanged: (value) {
                      setState(() {
                        minorTickHeight = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Label Vertical Offset: ${labelVerticalOffset.toStringAsFixed(1)}'),
                  Slider(
                    value: labelVerticalOffset,
                    min: 10.0,
                    max: 50.0,
                    onChanged: (value) {
                      setState(() {
                        labelVerticalOffset = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
