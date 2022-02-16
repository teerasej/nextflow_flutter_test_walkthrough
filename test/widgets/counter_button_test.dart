import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_button.dart';
import 'package:provider/provider.dart';

void main() {
  group('Widget: Counter Button', () {
    // late CounterProvider counterProvider;

    // setUp(() {
    //   counterProvider = CounterProvider();
    // });

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

  });
}
