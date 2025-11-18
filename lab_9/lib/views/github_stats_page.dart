import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/github_vm.dart';

class GitHubStatsPage extends StatefulWidget {
  const GitHubStatsPage({super.key});

  @override
  State<GitHubStatsPage> createState() => _GitHubStatsPageState();
}

class _GitHubStatsPageState extends State<GitHubStatsPage> {
  final TextEditingController _ctrl = TextEditingController(text: 'sofiiapodopryhora');

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<GithubViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Stats')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: const InputDecoration(labelText: 'GitHub username'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => vm.loadUser(_ctrl.text.trim()),
              child: const Text('Load'),
            ),
            const SizedBox(height: 16),
            if (vm.loading) const CircularProgressIndicator(),
            if (vm.error != null) Text('Error: ${vm.error}', style: const TextStyle(color: Colors.red)),
            if (vm.user != null) _buildProfile(vm),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(GithubViewModel vm) {
    final p = vm.user!;
    return Expanded(
      child: Card(
        margin: const EdgeInsets.only(top: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              if (p.avatarUrl != null)
                Center(child: Image.network(p.avatarUrl!, width: 100, height: 100)),
              const SizedBox(height: 8),
              Text(p.name ?? p.login, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              if (p.bio != null) Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(p.bio!),
              ),
              const SizedBox(height: 12),
              Text('Public repos: ${p.publicRepos}'),
              Text('Followers: ${p.followers}'),
              Text('Following: ${p.following}'),
              if (p.htmlUrl != null) Text('Profile: ${p.htmlUrl}'),
              if (p.createdAt != null) Text('Created: ${p.createdAt}'),
            ],
          ),
        ),
      ),
    );
  }
}