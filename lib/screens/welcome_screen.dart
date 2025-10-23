import 'package:flutter/material.dart';
import 'package:treasure_hunt/screens/home_screen.dart';
import 'package:treasure_hunt/widgets/custom_buttons.dart';
import 'package:treasure_hunt/widgets/social_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f1c22),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(children: [
                  Text(
                    'Your Next\nAdventure\nAwaits.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Discover hidden gems, solve riddles, and embark on epic scavenger hunts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      color: Colors.white70,
                    ),
                  ),
                ]),
                Column(
                  children: [
                    CustomButton(
                      label: 'Create Account',
                      type: ButtonType.primary,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: 'Sign In',
                      type: ButtonType.secondary,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Or continue with',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SocialButton(
                        backgroundColor: const Color(0xFFDB4437), // Google red
                        assetPath: 'assets/icons/google_white.svg',
                        onTap: () {
                          print('Google login');
                        },
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        backgroundColor:
                            const Color(0xFF1877F2), // Facebook blue
                        assetPath: 'assets/icons/face_white.svg',
                        onTap: () {
                          print('Facebook login');
                        },
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        backgroundColor: Colors.black, // Apple black
                        assetPath: 'assets/icons/apple_white.svg',
                        onTap: () {
                          print('Apple login');
                        },
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
