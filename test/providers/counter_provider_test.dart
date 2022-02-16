import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';

class MockCallBackFuntion extends Mock {
  call();
}

void main() {
  group('counter provider', () {
    late CounterProvider provider;
    final notifyListenerCallback = MockCallBackFuntion();

    setUp(() {
      provider = CounterProvider()..addListener(notifyListenerCallback);
      reset(notifyListenerCallback);
    });

    test('initial value is 0', () {
      expect(provider.count, 0);
    });

    test('increment should add 1 to counter', () {
      provider.increment();
      expect(provider.count, 1);
      provider.increment();
      expect(provider.count, 2);
      verify(notifyListenerCallback()).called(2);
    });
  });
}
