import 'package:counter_app/features/counter/bloc/counter_bloc.dart';
import 'package:counter_app/features/counter/bloc/counter_event.dart';
import 'package:counter_app/features/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final TextEditingController controller = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        backgroundColor: Colors.deepPurple.withOpacity(0.7),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          title: const Text('Counter App'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.value.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: controller,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter ammount to be increase or decreace',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      try {
                        int value = int.parse(controller.text);
                        context
                            .read<CounterBloc>()
                            .add(IncreaseCounterEvent(value));
                      } catch (e) {
                        showWarning(context);
                      }
                    },
                    child: const Text('Increase'),
                  );
                }),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      try {
                        int value = int.parse(controller.text);
                        context
                            .read<CounterBloc>()
                            .add(DecreaseCounterEvent(value));
                      } catch (e) {
                        showWarning(context);
                      }
                    },
                    child: const Text('Decrease'),
                  );
                }),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      controller.text = '1';
                      context.read<CounterBloc>().add(ResetCounterEvent());
                    },
                    child: const Text('Reset'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Warning!',
            style: TextStyle(color: Colors.amber),
          ),
          content: const Text(
            'Invalid Input!',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
