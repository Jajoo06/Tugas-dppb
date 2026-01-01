import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogoutRequested());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Page!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/posts');
              },
              child: const Text('View Posts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: const Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
