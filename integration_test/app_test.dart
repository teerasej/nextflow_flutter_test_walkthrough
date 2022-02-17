import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:nextflow_flutter_test_walkthrough/main.dart' as app;
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('1'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byType(CounterButton);

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('2'), findsOneWidget);
    });
  });
}
