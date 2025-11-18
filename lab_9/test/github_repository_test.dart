import 'package:flutter_test/flutter_test.dart';
import 'package:cards_app/repository/github_repository.dart';
import 'package:cards_app/services/github_service.dart';
import 'package:cards_app/model/github_user.dart';

class MockGitHubService extends GitHubService {
  @override
  Future<Map<String, dynamic>> fetchUser(String username) async {
    return {
      'login': username,
      'name': 'Sofia',
      'public_repos': 5,
      'followers': 3,
      'following': 2,
    };
  }
}

void main() {
  group('GithubRepository', () {
    test('fetchUser() returns GithubUser', () async {
      final repo = GithubRepository(MockGitHubService());
      final user = await repo.fetchUser('testuser');
      expect(user.login, 'testuser');
      expect(user.name, 'Sofia');
      expect(user.publicRepos, 5);
    });
  });
}
