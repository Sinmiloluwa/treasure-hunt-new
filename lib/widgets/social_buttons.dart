import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final Color backgroundColor;
  final VoidCallback onTap;
  final String text;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.backgroundColor,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: 1,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 108,
          height: 42,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: const Color(0xFF933DFC), width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
