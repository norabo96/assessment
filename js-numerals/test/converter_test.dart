import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_phrase_converter/main.dart';

void main() {
  testWidgets('Test converter: 7', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "7");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('seven'), findsOneWidget);
  });

  testWidgets('Test converter: 42', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "42");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('forty-two'), findsOneWidget);
  });

  testWidgets('Test converter: 2001', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "2001");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('two thousand and one'), findsOneWidget);
  });

  testWidgets('Test converter: 1999', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "1999");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('one thousand nine hundred and ninety-nine'), findsOneWidget);
  });

  testWidgets('Test converter: 17999', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "17999");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('seventeen thousand nine hundred and ninety-nine'), findsOneWidget);
  });

  testWidgets('Test converter: 342251', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "342251");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('three hundred and forty-two thousand two hundred and fifty-one'), findsOneWidget);
  });

  testWidgets('Test converter: 1300420', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsNWidgets(1));

    var numberField = textFormField.at(0);
    await tester.enterText(numberField, "1300420");

    var button = find.byType(TextButton);
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.pumpAndSettle();
    expect(find.text('one million three hundred thousand four hundred and twenty'), findsOneWidget);
  });
}
