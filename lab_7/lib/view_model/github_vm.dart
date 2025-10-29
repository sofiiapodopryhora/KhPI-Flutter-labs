import 'package:flutter/foundation.dart';
import '../model/github_user.dart';
import '../repository/github_repository.dart';

class GithubViewModel extends ChangeNotifier {
  final GithubRepository repository;
  GithubUser? user;
  bool loading = false;
  String? error;

  GithubViewModel(this.repository);

  Future<void> loadUser(String username) async {
    loading = true;
    error = null;
    user = null;
    notifyListeners();
    try {
      user = await repository.fetchUser(username);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}