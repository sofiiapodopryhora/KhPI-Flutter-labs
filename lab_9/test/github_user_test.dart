import 'package:flutter_test/flutter_test.dart';
import 'package:cards_app/model/github_user.dart';

void main() {
  group('GithubUser', () {
    test('fromJson() parses correctly', () {
      final json = {
        'login': 'sofiiapodopryhora',
        'name': 'Sofia',
        'avatar_url': 'http://example.com/avatar.png',
        'bio': 'Flutter dev',
        'public_repos': 10,
        'followers': 5,
        'following': 2,
        'html_url': 'http://github.com/sofiiapodopryhora',
        'created_at': '2023-01-01T00:00:00Z',
      };

      final user = GithubUser.fromJson(json);
      expect(user.login, 'sofiiapodopryhora');
      expect(user.name, 'Sofia');
      expect(user.publicRepos, 10);
      expect(user.createdAt!.year, 2023);
    });
  });
}
