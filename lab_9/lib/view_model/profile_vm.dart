import 'package:flutter/material.dart';
import '../model/user_profile.dart';
import '../repository/user_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();

  late List<UserProfile> _profiles;
  UserProfile? _selectedProfile;

  ProfileViewModel() {
    // Ініціалізуємо асинхронно дані з репозиторію
    _profiles = [];
    _init();
  }

  Future<void> _init() async {
    await _repository.load();
    _profiles = _repository.getAllProfiles();
    notifyListeners();
  }

  List<UserProfile> get profiles => _profiles;

  UserProfile? get selectedProfile => _selectedProfile;

  void selectProfile(UserProfile profile) {
    _selectedProfile = profile;
    notifyListeners();
  }

  // Створює пустий профіль і робить його вибраним (для створення з нуля)
  void createEmptyProfile() {
    final empty = UserProfile(
      name: '',
      profession: '',
      email: '',
      phone: '',
      about: '',
    );
    selectProfile(empty);
  }

  // Дублює існуючий профіль (створює новий екземпляр і робить його вибраним)
  void duplicateProfile(UserProfile profile) {
    final copy = UserProfile(
      name: profile.name,
      profession: profile.profession,
      email: profile.email,
      phone: profile.phone,
      about: profile.about,
    );
    selectProfile(copy);
  }

  // Збереження переданого профілю в репозиторій (для нових резюме)
  Future<void> saveProfile(UserProfile profile) async {
    // Якщо такий об'єкт ще не існує в списку (новий екземпляр) — додаємо
    if (!_profiles.contains(profile)) {
      await _repository.addProfile(profile);
      _profiles = _repository.getAllProfiles();
      _selectedProfile = profile;
      notifyListeners();
    } else {
      // Якщо потрібно реалізувати оновлення існуючого — додати логіку тут
      notifyListeners();
    }
  }

  Future<void> deleteProfile(UserProfile profile) async {
    await _repository.deleteProfile(profile);
    _profiles = _repository.getAllProfiles();
    if (_selectedProfile == profile) {
      _selectedProfile = null;
    }
    notifyListeners();
  }
}
