import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mvc/auth/bloc/auth_bloc.dart';
import '../mvc/auth/data/auth_repository.dart';
import '../mvc/auth/data/auth_storage.dart';
import '../mvc/auth/view/login_page.dart';
import '../mvc/auth/view/register_page.dart';
import '../mvc/home/view/home_page.dart';
import '../mvc/profile/view/profile_page.dart';
import '../mvc/settings/view/settings_page.dart';
import '../mvc/posts/bloc/post_bloc.dart';
import '../mvc/posts/data/post_repository.dart';
import '../mvc/posts/view/post_page.dart';

class AppRouter {
  AppRouter({
    required this.authRepository,
    required this.authStorage,
    required this.postRepository,
  });

  final AuthRepository authRepository;
  final AuthStorage authStorage;
  final PostRepository postRepository;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PostPage.routeName:
      case '/':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
            value: postRepository,
            child: BlocProvider(
              create: (_) => PostBloc(postRepository)..add(const PostFetched()),
              child: const PostPage(),
            ), // BlocProvider
          ), // RepositoryProvider.value
        ); // MaterialPageRoute

      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authRepository),
              RepositoryProvider.value(value: authStorage),
            ],
            child: BlocProvider(
              create: (_) => AuthBloc(
                authRepository: authRepository,
                authStorage: authStorage,
              ),
              child: const LoginPage(),
            ), // BlocProvider
          ), // MultiRepositoryProvider
        ); // MaterialPageRoute

      case RegisterPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authRepository),
              RepositoryProvider.value(value: authStorage),
            ],
            child: BlocProvider(
              create: (_) => AuthBloc(
                authRepository: authRepository,
                authStorage: authStorage,
              ),
              child: const RegisterPage(),
            ), // BlocProvider
          ), // MultiRepositoryProvider
        ); // MaterialPageRoute

      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authRepository),
              RepositoryProvider.value(value: authStorage),
            ],
            child: BlocProvider(
              create: (_) => AuthBloc(
                authRepository: authRepository,
                authStorage: authStorage,
              ),
              child: const HomePage(),
            ), // BlocProvider
          ), // MultiRepositoryProvider
        ); // MaterialPageRoute

      case ProfilePage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authRepository),
              RepositoryProvider.value(value: authStorage),
            ],
            child: BlocProvider(
              create: (_) => AuthBloc(
                authRepository: authRepository,
                authStorage: authStorage,
              ),
              child: const ProfilePage(),
            ), // BlocProvider
          ), // MultiRepositoryProvider
        ); // MaterialPageRoute

      case SettingsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authRepository),
              RepositoryProvider.value(value: authStorage),
            ],
            child: BlocProvider(
              create: (_) => AuthBloc(
                authRepository: authRepository,
                authStorage: authStorage,
              ),
              child: const SettingsPage(),
            ), // BlocProvider
          ), // MultiRepositoryProvider
        ); // MaterialPageRoute

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ), // Scaffold
        ); // MaterialPageRoute
    }
  }
}
