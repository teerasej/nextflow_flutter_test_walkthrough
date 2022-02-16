import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:nextflow_flutter_test_walkthrough/widgets/counter_view.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Should have a text: 0', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => CounterProvider(),
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
}
