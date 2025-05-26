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

  @override
  Widget build(BuildContext context) {

    // Access the CounterCubit instance
    final counterState = context.watch<CounterCubit>().state;


    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
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
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              // Decrement counter logic
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
