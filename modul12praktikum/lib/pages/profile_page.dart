import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Profil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Ini adalah Halaman Profil",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Home"),
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
          title: const Text("Profile Alert"),
          content: const Text("Ini adalah AlertDialog di halaman Profil."),
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
        content: Text("SnackBar dari halaman Profil!"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
