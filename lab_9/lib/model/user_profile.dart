import 'dart:convert';

class UserProfile {
  final String name;
  final String profession;
  final String email;
  final String phone;
  final String about;

  UserProfile({
    required this.name,
    required this.profession,
    required this.email,
    required this.phone,
    required this.about,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'profession': profession,
        'email': email,
        'phone': phone,
        'about': about,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? '',
      profession: json['profession'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      about: json['about'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.name == name &&
        other.profession == profession &&
        other.email == email &&
        other.phone == phone &&
        other.about == about;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      profession.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      about.hashCode;

  @override
  String toString() => jsonEncode(toJson());
}