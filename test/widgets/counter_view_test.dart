import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('CounterView Widget', () {
    testWidgets('At beginning, should have text as 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => CounterProvider(),
            child: CounterView(),
          ),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets(
        'If counter provider increased, CounterView should have text as 2',
        (WidgetTester tester) async {
      var provider = CounterProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => provider,
            child: CounterView(),
          ),
        ),
      );

      provider.increment();
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);
    });
  });
}
