import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/profile_vm.dart';
import '../view_model/theme_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final themeVM = context.watch<ThemeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("#резюме_білдер"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'GitHub stats',
            onPressed: () => context.go('/github'),
          ),
          IconButton(
            icon: Icon(themeVM.isDark ? Icons.dark_mode : Icons.light_mode),
            tooltip: 'Перемкнути тему',
            onPressed: () => themeVM.toggleTheme(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vm.profiles.length,
        itemBuilder: (context, index) {
          final profile = vm.profiles[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(profile.name.isNotEmpty ? profile.name[0] : '?'),
            ),
            title: Text(profile.name.isNotEmpty ? profile.name : '(Нове резюме)'),
            subtitle: Text(profile.profession),
            onTap: () {
              vm.selectProfile(profile);
              context.go('/details');
            },
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              tooltip: 'Duplicate',
              onPressed: () {
                vm.duplicateProfile(profile);
                context.go('/edit');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.createEmptyProfile();
          context.go('/edit');
        },
        child: const Icon(Icons.add),
        tooltip: 'Create new resume',
      ),
    );
  }
}
