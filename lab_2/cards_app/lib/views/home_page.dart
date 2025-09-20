import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../view_model/profile_vm.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileViewModel>().profile;

    return Scaffold(
      appBar: AppBar(title: Text("#резюме_білдер ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text(profile.name[0], style: TextStyle(fontSize: 40)),
            ),
            SizedBox(height: 10),
            Text(
              profile.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              profile.profession,
              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 96, 93, 93)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: Text("Більше"),
            ),
          ],
        ),
      ),
    );
  }
}