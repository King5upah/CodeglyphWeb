import 'package:flutter_test/flutter_test.dart';
import 'package:codeglyphs/main.dart';

void main() {
  testWidgets('Demo app loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CodeglyphsDemoApp());
    expect(find.text('Codéglyphs 🏴‍☠️📜'), findsOneWidget);
  });
}
