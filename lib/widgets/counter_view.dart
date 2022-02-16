import 'package:flutter/material.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
        builder: (context, CounterProvider counter, _) {
      return Text('${counter.count}');
    });
  }
}
