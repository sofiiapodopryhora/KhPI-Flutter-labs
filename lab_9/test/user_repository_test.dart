import 'package:flutter_test/flutter_test.dart';
import 'package:cards_app/repository/user_repository.dart';
import 'package:cards_app/model/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('UserRepository', () {
    late UserRepository repo;

    setUp(() async {
      SharedPreferences.setMockInitialValues({}); // мок SharedPreferences
      repo = UserRepository();
      await repo.load();
    });

    test('initial profiles loaded', () {
      final profiles = repo.getAllProfiles();
      expect(profiles.length, greaterThanOrEqualTo(3)); // дефолтні профілі
    });

    test('addProfile() adds a profile', () async {
      final newProfile = UserProfile(
        name: 'Test',
        profession: 'Tester',
        email: 'test@example.com',
        phone: '000',
        about: 'About test',
      );
      await repo.addProfile(newProfile);
      final profiles = repo.getAllProfiles();
      expect(profiles.contains(newProfile), true);
    });

    test('deleteProfile() removes a profile', () async {
      final profile = repo.getAllProfiles().first;
      await repo.deleteProfile(profile);
      final profiles = repo.getAllProfiles();
      expect(profiles.contains(profile), false);
    });
  });
}
