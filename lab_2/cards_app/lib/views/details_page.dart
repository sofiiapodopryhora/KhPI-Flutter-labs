import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/profile_vm.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileViewModel>().profile;

    return Scaffold(
      appBar: AppBar(title: Text("Деталі профілю")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Про мене:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(profile.about),
            SizedBox(height: 20),
            Text("Контакти:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Email: ${profile.email}"),
            Text("Телефон: ${profile.phone}"),
          ],
        ),
      ),
    );
  }
}