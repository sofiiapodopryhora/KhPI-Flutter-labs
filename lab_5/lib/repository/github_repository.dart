import '../model/github_user.dart';
import '../services/github_service.dart';

class GithubRepository {
  final GitHubService service;
  GithubRepository(this.service);

  Future<GithubUser> fetchUser(String username) async {
    final data = await service.fetchUser(username);
    return GithubUser.fromJson(data);
  }
}