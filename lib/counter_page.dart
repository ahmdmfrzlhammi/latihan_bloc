import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/bilangan_Primer/bilangan_primer_cubit.dart';
import 'package:latihan_bloc/bloc/ganjil_genap/ganjilgenap_cubit.dart';
// ignore: unused_import
import 'ganjilgenap_cubit.dart'; // Import your GanjilgenapCubit
import 'counter_cubit.dart';
import 'visibility_cubit.dart'; // Import your VisibilityCubit

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GanjilGenap Section
            BlocBuilder<GanjilgenapCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(state == 0 ? 'Ganjil' : 'Genap'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<GanjilgenapCubit>().hitunganganjilgenap(5); // Call the method properly
                      },
                      child: const Text('Ganjil/Genap'),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
            
BlocBuilder<BilanganPrimerCubit, BilanganPrimerState>(
  builder: (context, state) {
    return Column(
      children: [
        if (state is BilanganPrima)
          Text('${state.number} adalah bilangan prima')
        else if (state is BilanganBukanPrima)
          Text('${state.number} bukan bilangan prima')
        else
          const Text('Masukkan bilangan'),

        ElevatedButton(
          onPressed: () {
            context.read<BilanganPrimerCubit>().cekBilanganPrima(1); // Replace 5 with your number input
          },
          child: const Text('Cek Bilangan Prima'),
        ),
        const SizedBox(height: 10),
      ],
    );
  },
),



            // Counter Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return Text(
                      '$count',
                      style: const TextStyle(fontSize: 36),
                    );
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Visibility Toggle
            BlocBuilder<VisibilityCubit, bool>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<VisibilityCubit>().change();
                  },
                  icon: Icon(
                    state ? Icons.visibility : Icons.visibility_off,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.clear), // Multiplication icon
            onPressed: () => context.read<CounterCubit>().multiply(2), // Multiplies by 2
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.horizontal_split), // Division icon
            onPressed: () => context.read<CounterCubit>().divide(2), // Divides by 2
          ),
        ],
      ),
    );
  }
}
