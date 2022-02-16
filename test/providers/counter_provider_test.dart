import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';

void main() {
  group('counter provider', () {
    test('initial value is 0', () {
      var provider = CounterProvider();
      expect(provider.count, 0);
    });

    test('increment should add 1 to counter', () {
      var provider = CounterProvider();
      provider.increment();
      expect(provider.count, 1);
      provider.increment();
      expect(provider.count, 2);
    });
  });
}
