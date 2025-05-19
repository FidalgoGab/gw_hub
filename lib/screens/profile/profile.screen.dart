import 'package:flutter/material.dart';
import 'package:gw_hub/api/profile.api.dart';
import 'package:gw_hub/models/screen/profile.model.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/widgets/base_button.widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel>(
        future: ProfileApi.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LinearProgressIndicator());
          }

          if (snapshot.error != null) {
            return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ocorreu um erro, tente novamente mais tarde')
                ]);
          }

          ProfileModel profileData = snapshot.data!;

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Olá, ${profileData.username}',
                      style: const TextStyle(
                          fontSize: 24,
                          color: blackTypography,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(200)),
                          border: Border.all(color: blackSecondary)),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200)),
                        child: Image.network(
                          profileData.image,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Suas informações',
                    style: TextStyle(
                        fontSize: 20,
                        color: blackTypography,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Nome de usuário',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackSecondary,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    profileData.username,
                    style: const TextStyle(
                        fontSize: 16,
                        color: blackTypography,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'E-mail',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackSecondary,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    profileData.email,
                    style: const TextStyle(
                        fontSize: 16,
                        color: blackTypography,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          child: BaseButton(
                        text: 'Sair',
                        contained: false,
                      )))
                ],
              ),
            ),
          );
        });
  }
}
