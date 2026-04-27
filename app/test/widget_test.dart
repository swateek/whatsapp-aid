import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:whatsapp_aid/main.dart';

void main() {
  testWidgets('renders WhatsApp Aid form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('WhatsApp Aid'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(
      find.text('Enter a phone number, like +9199000XXXXX'),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.message), findsOneWidget);
  });
}
