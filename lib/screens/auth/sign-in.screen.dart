import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/widgets/base_button.widget.dart';
import 'package:gw_hub/ui/widgets/text_input.widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: redPrimary.withAlpha(70),
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.g_mobiledata_outlined,
                          color: redPrimary,
                          size: 48,
                        ),
                        Icon(
                          Icons.h_mobiledata_outlined,
                          color: redPrimary,
                          size: 48,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const TextInputWidget(label: 'e-mail'),
                    const SizedBox(height: 16),
                    const TextInputWidget(label: 'senha'),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: widgetBackground,
                          ),
                          child: const Center(
                            child: Text(
                              'G',
                              style: TextStyle(color: redPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.center,
                      child: BaseButton(text: 'Criar conta'),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: const Text(
                          'Já tem conta? Realize o seu login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                            decorationColor: redPrimary,
                            fontSize: 12,
                            color: redPrimary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
