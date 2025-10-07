import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_router/app_router.dart';
import 'view_model/profile_vm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
      child: MaterialApp.router(
        title: 'Resume Builder',
        routerConfig: router,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}