import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/service_locator.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/login_cubit/login_cubit.dart';
import 'package:timease_mobile/features/authentication/presentation/manger/register_cubit/register_cubit.dart';
import 'package:timease_mobile/features/authentication/presentation/views/auth_screen_view.dart';
import 'package:timease_mobile/features/authentication/presentation/views/login_screen_view.dart';
import 'package:timease_mobile/features/authentication/presentation/views/register_screen_view.dart';
import 'package:timease_mobile/features/home/presentation/views/home_screen_view.dart';
import 'package:timease_mobile/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const authScreen = '/authScreenView';
  static const loginScreen = '/LoginScreenView';
  static const registerScreen = '/RegisterScreenView';
  static const homeScreen = '/homeScreenView';
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: authScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const AuthScreenView();
            },
          ),
          GoRoute(
            path: loginScreen,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (BuildContext context) {
                  return LoginCubit(
                      getIt.get<AuthRepoImpl>()
                  );
                },
                child: const LoginScreenView(),
              );
            },
          ),
          GoRoute(
            path: registerScreen,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                  create: (BuildContext context) =>
                      RegisterCubit(getIt.get<AuthRepoImpl>()),
                  child: const RegisterScreenView());
            },
          ),
          GoRoute(
            path: homeScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreenView();
            },
          ),
        ],
      ),
    ],
  );
}
