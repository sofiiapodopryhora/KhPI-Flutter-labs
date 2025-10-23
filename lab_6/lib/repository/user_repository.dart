import '../model/user_profile.dart';

class UserRepository {
  final List<UserProfile> _profiles = [
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

  List<UserProfile> getAllProfiles() => _profiles;

  // Додає новий профіль у репозиторій
  void addProfile(UserProfile profile) {
    _profiles.add(profile);
  }
}
