// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('Get repositories with valid user', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(Uri.parse('https://api.github.com/users/' + 'jshier' + '/repos'));

      final HttpClientResponse response = await request.close();
      expect(response.statusCode.toInt(), 200);
    });
  });

  testWidgets('Get repositories with invalid user', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(Uri.parse('https://api.github.com/users/' + 'dsgagrdv' + '/repos'));

      final HttpClientResponse response = await request.close();
      expect(response.statusCode.toInt(), 404);
    });
  });

  testWidgets('Get issues with valid repository', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(Uri.parse('https://api.github.com/repos/'+ 'jshier' + '/' + 'HazeLight' + '/issues'));

      final HttpClientResponse response = await request.close();
      expect(response.statusCode.toInt(), 200);
    });
  });

  testWidgets('Get issues with invalid repository', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(Uri.parse('https://api.github.com/repos/'+ 'jshier' + '/' + 'sasdgsdg' + '/issues'));

      final HttpClientResponse response = await request.close();
      expect(response.statusCode.toInt(), 404);
    });
  });
}
