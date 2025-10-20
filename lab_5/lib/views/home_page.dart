import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/profile_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("#резюме_білдер"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'GitHub stats',
            onPressed: () => context.go('/github'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vm.profiles.length,
        itemBuilder: (context, index) {
          final profile = vm.profiles[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(profile.name[0]),
            ),
            title: Text(profile.name),
            subtitle: Text(profile.profession),
            onTap: () {
              vm.selectProfile(profile);
              context.go('/details');
            },
          );
        },
      ),
    );
  }
}
