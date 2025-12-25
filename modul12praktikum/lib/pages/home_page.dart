import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Halaman Utama",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text(
                  'Counter: $count',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text("+"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text("Pergi ke Halaman Profil"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text("Pergi ke Halaman Pengaturan"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: const Text("Tampilkan AlertDialog"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                _showSnackBar(context);
              },
              child: const Text("Tampilkan SnackBar"),
            ),

            const Text(
              "Zahran Rauhillah Raziq (707012400139)",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert Dialog"),
          content: const Text("Ini adalah contoh AlertDialog."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Ini adalah contoh SnackBar!"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
