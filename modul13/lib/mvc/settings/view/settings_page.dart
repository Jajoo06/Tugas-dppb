import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthLogoutRequested());
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
