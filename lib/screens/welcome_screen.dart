import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasure_hunt/pages/home_screen.dart';
import 'package:treasure_hunt/widgets/custom_buttons.dart';
import 'package:treasure_hunt/widgets/social_buttons.dart';
import 'package:treasure_hunt/widgets/widget_tree.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/icons/splash.svg',
                  width: 300, // optional
                  height: 300, // optional
                ),
                const SizedBox(height: 40),
                const Text(
                  'Let\'s get the hunting started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'signup or login to see what\'s happening \n near you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF933DFC),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WidgetTree()));
                  },
                  child: const Text('Continue with email',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'or continue with',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      assetPath: 'assets/icons/google_white.svg',
                      onTap: () {},
                      backgroundColor: const Color(0xFF3A3B3D),
                      text: 'Google',
                    ),
                    SocialButton(
                      assetPath: 'assets/icons/apple_white.svg',
                      onTap: () {},
                      backgroundColor: const Color(0xFF3A3B3D),
                      text: 'Apple',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text.rich(  
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By logging in or signing up you agree to our \n',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Color(0xFF933DFC),
                          fontSize: 12,
                        ),
                        // Add gesture recognizer if needed
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF933DFC),
                          fontSize: 12,
                        ),
                        // Add gesture recognizer if needed
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
