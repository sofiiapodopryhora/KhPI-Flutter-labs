import 'package:flutter_test/flutter_test.dart';
import 'package:cards_app/main.dart';

void main() {
  testWidgets('App loads home page with title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Cards App'), findsOneWidget);
  });
}