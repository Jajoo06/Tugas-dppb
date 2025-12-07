import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationOn = true;
  bool isDarkModeOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan Aplikasi")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notifikasi"),
              trailing: Switch(
                value: isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    isNotificationOn = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Mode Gelap"),
              trailing: Switch(
                value: isDarkModeOn,
                onChanged: (value) {
                  setState(() {
                    isDarkModeOn = value;
                  });
                },
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Home"),
            ),
          ],
        ),
      ),
    );
  }
}
