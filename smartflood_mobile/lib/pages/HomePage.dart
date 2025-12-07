import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Selamat Datang di SmartFlood Mobile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pemerintah Kabupaten Bandung merancang sistem SmartFlood untuk "
                  "memantau titik rawaan banjir (lokasi sensor) dan menampilkan "
                  "informasi status banjir ke warga melalui aplikasi mobile.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: 20),

              Image.asset(
                'assets/images/mobil.jpg',   
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

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

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lokasi');
                },
                child: const Text("Pergi ke Halaman Lokasi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
