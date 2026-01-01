import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.authenticated && state.user != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${state.user!.name}'),
                  Text('Email: ${state.user!.email}'),
                ],
              ),
            );
          }
          return const Center(child: Text('Not authenticated'));
        },
      ),
    );
  }
}
