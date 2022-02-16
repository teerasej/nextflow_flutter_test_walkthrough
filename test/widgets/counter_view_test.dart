import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('Widget: CounterView', () {
    late CounterProvider counterProvider;

    setUp(() {
      counterProvider = CounterProvider();
    });

    testWidgets('Should have a text: 0 at initial',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => counterProvider,
        child: Builder(
          builder: (context) {
            return Directionality(
              child: MediaQuery(
                data: MediaQueryData(),
                child: CounterView(),
              ),
              textDirection: TextDirection.ltr,
            );
          },
        ),
      ));

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Should have a text 1 after increment',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => counterProvider,
        child: Builder(
          builder: (context) {
            return Directionality(
              child: MediaQuery(
                data: MediaQueryData(),
                child: CounterView(),
              ),
              textDirection: TextDirection.ltr,
            );
          },
        ),
      ));

      counterProvider.increment();
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
