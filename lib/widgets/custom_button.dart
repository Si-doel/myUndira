import 'package:flutter/material.dart';

import '../config/app_theme.dart';

enum AppButtonType { primary, secondary, tertiary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool fullWidth;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: type == AppButtonType.primary
                ? Colors.white
                : AppTheme.primaryBlue,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(
            icon,
            size: 18,
            color: type == AppButtonType.primary
                ? Colors.white
                : AppTheme.primaryBlue,
          ),
        ],
      ],
    );

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: type == AppButtonType.primary
              ? AppTheme.primaryGradient
              : null,
          color: type == AppButtonType.secondary ? Colors.white : null,
          border: type == AppButtonType.secondary
              ? Border.all(color: AppTheme.primaryBlue, width: 1.2)
              : null,
          borderRadius: BorderRadius.circular(30),
          boxShadow: type == AppButtonType.primary
              ? [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.20),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: content,
      ),
    );
  }
}
