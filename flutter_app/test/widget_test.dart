// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/youtube/badge_widget.dart';
import 'package:flutter_app/youtube/counter/test_counter.dart';
import 'package:flutter_app/youtube/test_album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BadgeWidget(key: Key('badge_key'),));

    // Verify that our counter starts at 0.
    expect(find.text('9'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
  });

  test('test counter', () {
    final counter = TestCounter();
    counter.increase();
    expect(counter.count, 1);
  });

  test('returns a album if http call successfully', () async {
    final client = MockClient((request) async {
      if (request.url == Uri.parse('https://jsonplaceholder.typicode.com/albums/1')) {
        print('mock request');
        return http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200);
      }
      return http.Response('not found', 400);
    });
    final testAlum = TestAlbum();

    Album response = await testAlum.fetchAlbum(client);
    print('mock response:${response.title}');
    expect(response, isA<Album>());
  });
}
