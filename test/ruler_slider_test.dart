import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ruler_slider/ruler_slider.dart'; // Adjust the import path according to your project

void main() {
  testWidgets('RulerSlider renders correctly and calls onChanged', (WidgetTester tester) async {
    // Variable to capture the onChanged callback value
    double? changedValue;

    // Build the RulerSlider widget in a test environment
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RulerSlider(
            minValue: 0.0,
            maxValue: 100.0,
            initialValue: 50.0,
            onChanged: (double value) {
              print('onChanged called with value: $value'); // Debug output
              changedValue = value;
            },
          ),
        ),
      ),
    );

    // Verify the initial value of the slider is displayed correctly
    expect(find.text('50.0'), findsOneWidget);

    // Simulate a horizontal drag to change the value
    await tester.drag(find.byType(RulerSlider), const Offset(50.0, 0.0));
   await tester.pumpAndSettle(); // Ensure the interaction completes

    // Ensure that the onChanged callback was triggered and the value was updated
    expect(changedValue != null, true, reason: 'Expected onChanged to be called');
  });
}
