import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter ${context.select((CounterBloc counterBloc) => counterBloc.state.transactionCount)}'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(child: context.select( (CounterBloc counterBloc) => Text(
        'Counter: ${counterBloc.state.counter}',
        style: const TextStyle(fontSize: 24),
      ))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              increaseCounterBy(context, 3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12), // Add some space between buttons
          FloatingActionButton(
            onPressed: () {
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
