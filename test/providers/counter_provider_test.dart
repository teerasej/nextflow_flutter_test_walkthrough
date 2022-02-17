import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';

class MockCallbackFunction extends Mock {
  call();
}

void main() {
  group('Counter Provider', () {
    test('counter shoud start with 1', () {
      var provider = CounterProvider();

      expect(provider.count, 1);
    });

    test('after increment, counter should increase 1', () {
      var provider = CounterProvider();

      provider.increment();
      expect(provider.count, 2);
      provider.increment();
      expect(provider.count, 3);
      provider.increment();
      expect(provider.count, 4);
    });

    test('provider should notify listener after increment', () {
      var provider = CounterProvider();
      var notifyListenerFunction = MockCallbackFunction();

      provider.addListener(notifyListenerFunction);

      provider.increment();

      verify(notifyListenerFunction()).called(1);

      provider.increment();

      verify(notifyListenerFunction()).called(1);
    });
  });
}
