import 'package:gw_hub/models/screen/profile.model.dart';

class ProfileApi {
  static Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 600));

    ProfileModel profile = const ProfileModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr3jhpAFYpzxx39DRuXIYxNPXc0zI5F6IiMQ&s',
        username: 'Gabriel Fidalgo',
        email: 'gabriel.fidalgo@gmail.com');

    return profile;
  }
}
