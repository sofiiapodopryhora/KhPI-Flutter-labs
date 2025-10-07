import 'package:flutter/material.dart';
import '../model/user_profile.dart';
import '../repository/user_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();

  late List<UserProfile> _profiles;
  UserProfile? _selectedProfile;

  ProfileViewModel() {
    _profiles = _repository.getAllProfiles();
  }

  List<UserProfile> get profiles => _profiles;

  UserProfile? get selectedProfile => _selectedProfile;

  void selectProfile(UserProfile profile) {
    _selectedProfile = profile;
    notifyListeners();
  }
}
