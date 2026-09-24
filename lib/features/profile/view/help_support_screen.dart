import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  static const _supportEmail = 'davai.storee@gmail.com';

  Future<void> _openEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: _supportEmail,
      queryParameters: {'subject': 'طلب مساعدة — Davai Store'},
    );

    final launched = await launchUrl(uri);

    if (!launched && context.mounted) {
      await Clipboard.setData(const ClipboardData(text: _supportEmail));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.profile.emailHasBeenCopied)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final text = context.text;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Material(
                    color: colors.surfaceContainer,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    context.t.profile.helpAndSupport,
                    style: text.headlineSmall?.copyWith(letterSpacing: -0.3),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 32,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: context.colorScheme.onPrimary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.mail_outline_rounded,
                            size: 24,
                            color: colors.primary,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          context.t.profile.needHelp,
                          style: text.titleMedium,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          context.t.profile.contactUsAndWeWillGetBackToYou,
                          textAlign: TextAlign.center,
                          style: text.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => _openEmail(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: colors.inverseSurface,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.mail_outline_rounded,
                                  size: 15,
                                  color: colors.onInverseSurface,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  _supportEmail,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: colors.onInverseSurface,
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
