import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_router/app_router.dart';
import 'view_model/profile_vm.dart';
import 'view_model/github_vm.dart';
import 'repository/github_repository.dart';
import 'services/github_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileViewModel>(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider<GithubViewModel>(
          create: (_) => GithubViewModel(GithubRepository(GitHubService())),
        ),
      ],
      child: MaterialApp.router(
        title: 'Resume Builder',
        routerConfig: router,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}