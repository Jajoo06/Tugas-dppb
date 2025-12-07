import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Lokasi Sensor')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemArgs.lokasi,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), 
            const SizedBox(height: 12),
            Text(
              'Ketinggian: ${itemArgs.ketinggian} cm',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Status: ${itemArgs.status}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ), 
            const SizedBox(height: 8),
            Text(
              'Waktu: ${itemArgs.waktu}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ), 
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ), 
            ), 
          ],
        ), 
      ), 
    );
  }
}