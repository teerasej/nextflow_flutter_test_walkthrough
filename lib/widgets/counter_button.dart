import 'package:flutter/material.dart';
import 'package:nextflow_flutter_test_walkthrough/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterProvider>().increment();
      },
      child: const Icon(Icons.add),
    );
  }
}
