import 'package:flutter_test/flutter_test.dart';
import 'package:cards_app/model/user_profile.dart';
import 'dart:convert';

void main() {
  group('UserProfile', () {
    final profile = UserProfile(
      name: 'Sofia',
      profession: 'Flutter Developer',
      email: 'sofia@example.com',
      phone: '+380991234567',
      about: 'Test profile',
    );

    test('toJson() returns correct map', () {
      final jsonMap = profile.toJson();
      expect(jsonMap['name'], 'Sofia');
      expect(jsonMap['profession'], 'Flutter Developer');
      expect(jsonMap['email'], 'sofia@example.com');
    });

    test('fromJson() creates correct object', () {
      final map = {
        'name': 'Sofia',
        'profession': 'Flutter Developer',
        'email': 'sofia@example.com',
        'phone': '+380991234567',
        'about': 'Test profile',
      };
      final obj = UserProfile.fromJson(map);
      expect(obj, profile);
    });

    test('toString() returns JSON string', () {
      expect(profile.toString(), jsonEncode(profile.toJson()));
    });
  });
}
