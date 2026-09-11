import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final double height;
  final double borderRadius;
  final List<Color>? gradientColors;
  final Color? color;
  final Color textColor;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.height = 50,
    this.borderRadius = 12,
    this.gradientColors,
    this.color,
    this.textColor = Colors.white,
    this.width,
  });

  bool get _isEnabled => !isLoading && !isDisabled && onPressed != null;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _isEnabled ? 1 : 0.6,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: Material(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: _isEnabled ? onPressed : null,
            splashColor: Colors.white24,
            highlightColor: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: gradientColors != null
                    ? LinearGradient(colors: gradientColors!)
                    : null,
                color: gradientColors == null
                    ? (color ?? Theme.of(context).primaryColor)
                    : null,
              ),
              child: Center(
                child: isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null) ...[
                            Icon(icon, color: textColor, size: 20),
                            SizedBox(width: AppSpacing.sm),
                          ],
                          Text(
                            overflow: TextOverflow.ellipsis,
                            text,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
