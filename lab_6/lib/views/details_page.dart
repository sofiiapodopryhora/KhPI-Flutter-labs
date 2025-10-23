import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/profile_vm.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final profile = vm.selectedProfile;

    if (profile == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text("Деталі профілю"),
        ),
        body: const Center(child: Text("Профіль не вибрано")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: Text(profile.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.profession,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Про мене:", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(profile.about),
            const SizedBox(height: 20),
            Text("Контакти:",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Email: ${profile.email}"),
            Text("Телефон: ${profile.phone}"),
          ],
        ),
      ),
    );
  }
}
