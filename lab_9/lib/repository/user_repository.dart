import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_profile.dart';

class UserRepository {
  static const String _storageKey = 'user_profiles';

  final List<UserProfile> _defaultProfiles = [
    UserProfile(
      name: "Софія",
      profession: "Flutter Developer",
      email: "sofiiadev@gmail.com",
      phone: "+380 99 123 45 67",
      about:
          "Flutter-розробниця з досвідом у створенні кросплатформних застосунків. Люблю чистий код і котиків.",
    ),
    UserProfile(
      name: "Ярослав",
      profession: "Backend Engineer",
      email: "yar.engineer@gmail.com",
      phone: "+380 97 234 56 78",
      about:
          "Працюю з Node.js, Nest.js та базами даних. Цікавлюсь оптимізацією продуктивності.",
    ),
    UserProfile(
      name: "Марія",
      profession: "UI/UX Designer",
      email: "maria.design@gmail.com",
      phone: "+380 68 987 65 43",
      about:
          "Дизайнерка, створюю лаконічні інтерфейси. Використовую Figma, Miro та трохи Flutter для прототипів.",
    ),
  ];

  List<UserProfile> _profiles = [];

  UserRepository() {
    // пусто — треба викликати load() асинхронно звідти, хто створює репозиторій
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null) {
      _profiles = List<UserProfile>.from(_defaultProfiles);
      await _saveAll(); // зберегти дефолтні для наступних запусків
    } else {
      try {
        final list = jsonDecode(raw) as List<dynamic>;
        _profiles = list.map((e) => UserProfile.fromJson(e as Map<String, dynamic>)).toList();
      } catch (_) {
        _profiles = List<UserProfile>.from(_defaultProfiles);
      }
    }
  }

  List<UserProfile> getAllProfiles() => List.unmodifiable(_profiles);

  // Додає новий профіль у репозиторій і зберігає
  Future<void> addProfile(UserProfile profile) async {
    _profiles.add(profile);
    await _saveAll();
  }

  Future<void> deleteProfile(UserProfile profile) async {
    _profiles.removeWhere((p) => p == profile);
    await _saveAll();
  }

  Future<void> _saveAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_profiles.map((p) => p.toJson()).toList());
    await prefs.setString(_storageKey, raw);
  }
}
