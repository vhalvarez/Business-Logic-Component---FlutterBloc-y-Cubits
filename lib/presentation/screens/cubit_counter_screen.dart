import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, int value) {
    // Access the CounterCubit instance and call increaseBy
    context.read<CounterCubit>().increaseBy(value);
  }

  void resetCounter(BuildContext context) {
    // Access the CounterCubit instance and call reset
    context.read<CounterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    // Access the CounterCubit instance
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterCubit cubit) => Text('Cubit Counter: ${cubit.state.transactionCount}'),
        ),
        // title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () => {resetCounter(context)},
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          //   buildWhen: (previous, current) => current.counter != previous.counter,
          // Only rebuild when the counter value changes
          builder: (context, state) {
            // print('counter cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              // Increment counter logic
              increaseCounterBy(context, 3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
              increaseCounterBy(context, 2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
              increaseCounterBy(context, 1);
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
