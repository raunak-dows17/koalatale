import 'package:flutter_test/flutter_test.dart';

import 'package:koalatale/main.dart';

void main() {
  testWidgets('Stories Test', (WidgetTester tester) async {
    await tester.pumpWidget(const KoalataleApp());
  });
}
