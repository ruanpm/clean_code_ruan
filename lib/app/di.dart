import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_code_ruan/data/repositories/user_repository_impl.dart';
import 'package:clean_code_ruan/data/sources/local/user_local_data_source.dart';
import 'package:clean_code_ruan/data/sources/remote/user_remote_data_source.dart';
import 'package:clean_code_ruan/domain/repositories/user_repository.dart';
import 'package:clean_code_ruan/domain/usecases/get_user.dart';
import 'package:clean_code_ruan/presentation/providers/user_provider.dart';

class AppDependencies extends StatelessWidget {
  final Widget child;

  AppDependencies({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Data sources
        Provider<UserRemoteDataSource>(
          create: (_) => UserRemoteDataSourceImpl(),
        ),
        Provider<UserLocalDataSource>(
          create: (_) => UserLocalDataSourceImpl(),
        ),

        // Repositories
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            remoteDataSource: context.read<UserRemoteDataSource>(),
            localDataSource: context.read<UserLocalDataSource>(),
          ),
        ),

        // Use cases
        Provider<GetUser>(
          create: (context) => GetUser(
            context.read<UserRepository>(),
          ),
        ),

        // Providers
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(
            getUser: context.read<GetUser>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
