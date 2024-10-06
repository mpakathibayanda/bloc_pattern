import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesplay/apps/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: 'increment',
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: const Icon(CupertinoIcons.minus),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<CounterCubit, int>(
                  builder: (context, counter) {
                    return Text(
                      '$counter',
                      style: const TextStyle(
                          fontSize: 72, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              FloatingActionButton(
                heroTag: 'decrement',
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
