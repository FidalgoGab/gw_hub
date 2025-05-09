import 'package:gw_hub/models/screen/profile.model.dart';

class ProfileApi {
  static Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 600));

    ProfileModel profile = const ProfileModel(
        image:
            'https://s2-oglobo.glbimg.com/RxvRKNHvx9PhitTDbg8mkXp5P_E=/107x0:661x400/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2025/Q/U/UwAyNcR6AUDNDuoaVodg/divulgacao.png',
        username: 'fidasgabriel',
        email: 'fidsfids@gmail.com');

    return profile;
  }
}
