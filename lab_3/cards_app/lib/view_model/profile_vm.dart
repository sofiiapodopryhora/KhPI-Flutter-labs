import 'package:flutter/material.dart';
import '../model/user_profile.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserProfile _profile = UserProfile(
    name: "Софія",
    profession: "Flutter Developer",
    email: "kotik@gmail.com",
    phone: "+380 99 123 45 67",
    about: "Я розробила перший крос-платформний додаток на Flutter :3 Люблю цікаві проєкти та котиків.",
  );

  UserProfile get profile => _profile;
}