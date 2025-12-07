import 'package:flutter/material.dart';
import 'package:modul10/pages/LokasiDetail.dart';
import 'pages/ProfilePage.dart';
import 'pages/HomePage.dart';
import 'pages/SettingsPage.dart';
import 'pages/LokasiPage.dart';

void main() {
  runApp(const BelanjaApp());
}

class BelanjaApp extends StatelessWidget {
  const BelanjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartFlood Mobile',
      debugShowCheckedModeBanner: false,
      // halaman pertama yang dibuka
      initialRoute: '/',
      // daftar rute
      routes: {
         '/': (context) => const TabBarController(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/lokasi': (context) => const LokasiPage(),
        '/item': (context) => const ItemPage(),
      },
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    ); // MaterialApp
  }
}

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LokasiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Lokasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
