import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/profile_vm.dart';
import '../model/user_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameCtrl;
  late TextEditingController _professionCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _aboutCtrl;

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<ProfileViewModel>(context, listen: false);
    final p = vm.selectedProfile ??
        UserProfile(name: '', profession: '', email: '', phone: '', about: '');

    _nameCtrl = TextEditingController(text: p.name);
    _professionCtrl = TextEditingController(text: p.profession);
    _emailCtrl = TextEditingController(text: p.email);
    _phoneCtrl = TextEditingController(text: p.phone);
    _aboutCtrl = TextEditingController(text: p.about);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _professionCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _aboutCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final selected = vm.selectedProfile;
    if (selected == null) {
      // Якщо нічого не вибрано — повернутися назад на головну
      WidgetsBinding.instance.addPostFrameCallback((_) => context.go('/'));
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Редагувати резюме'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Імʼя'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _professionCtrl,
              decoration: const InputDecoration(labelText: 'Професія'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(labelText: 'Телефон'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _aboutCtrl,
              decoration: const InputDecoration(labelText: 'Про мене'),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newProfile = UserProfile(
                  name: _nameCtrl.text.trim(),
                  profession: _professionCtrl.text.trim(),
                  email: _emailCtrl.text.trim(),
                  phone: _phoneCtrl.text.trim(),
                  about: _aboutCtrl.text.trim(),
                );
                vm.saveProfile(newProfile);
                // Повернутись на головну після збереження
                context.go('/');
              },
              child: const Text('Зберегти'),
            ),
          ],
        ),
      ),
    );
  }
}