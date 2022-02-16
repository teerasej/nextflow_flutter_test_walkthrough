import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_button.dart';
import 'package:provider/provider.dart';

void main() {
  group('Widget: Counter Button', () {
    testWidgets('Should built with floating action button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Directionality(
              child: MediaQuery(
                data: MediaQueryData(),
                child: CounterButton(),
              ),
              textDirection: TextDirection.ltr,
            );
          },
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('Should contain add icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Directionality(
              child: MediaQuery(
                data: MediaQueryData(),
                child: CounterButton(),
              ),
              textDirection: TextDirection.ltr,
            );
          },
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('add icon should placed in Floating action button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Directionality(
              child: MediaQuery(
                data: MediaQueryData(),
                child: CounterButton(),
              ),
              textDirection: TextDirection.ltr,
            );
          },
        ),
      );

      expect(
        find.ancestor(
          of: find.byIcon(Icons.add),
          matching: find.byType(FloatingActionButton),
        ),
        findsOneWidget,
      );
    });
  });

  group(
    'Counter button in action',
    () {
      late CounterProvider counterProvider;

      setUp(() {
        counterProvider = CounterProvider();
      });
      testWidgets('press button should increment counter',
          (WidgetTester tester) async {
        await tester.pumpWidget(ChangeNotifierProvider(
          create: (context) => counterProvider,
          child: Builder(
            builder: (context) {
              return Directionality(
                child: MediaQuery(
                  data: MediaQueryData(),
                  child: CounterButton(),
                ),
                textDirection: TextDirection.ltr,
              );
            },
          ),
        ));

        await tester.tap(find.byType(CounterButton));

        expect(counterProvider.count, 1);

        await tester.tap(find.byType(CounterButton));
        expect(counterProvider.count, 2);
      });
    },
  );
}
