import 'dart:ui';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final double maxWidth;
  final double minWidth;
  final double height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.maxWidth = 480,
    this.minWidth = 84,
    this.height = 56,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isPrimary = widget.type == ButtonType.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedScale(
        scale: isHovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              if (!isPrimary)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(color: Colors.transparent),
                ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: widget.maxWidth,
                  minWidth: widget.minWidth,
                ),
                height: widget.height,
                decoration: BoxDecoration(
                  color: isPrimary
                      ? const Color(0xFFEB5757)
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isPrimary
                      ? [
                          BoxShadow(
                            color: const Color(0xFFEB5757).withOpacity(0.6),
                            blurRadius: 25,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Jakarta',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.015,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: widget.onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
