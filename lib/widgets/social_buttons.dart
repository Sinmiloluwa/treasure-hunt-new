import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final Color backgroundColor;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: 1,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
