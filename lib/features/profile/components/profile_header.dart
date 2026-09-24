import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/profile/provider/profile_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'edit_name_dialog.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ImageProvider? imageProvider;

    if (profile.imageFile != null) {
      imageProvider = FileImage(profile.imageFile!);
    } else if (profile.imageUrl != null && profile.imageUrl!.isNotEmpty) {
      imageProvider = NetworkImage(profile.imageUrl!);
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await notifier.pickImageAndUpload();
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: colorScheme.primary,
                  backgroundImage: imageProvider,
                  child: imageProvider == null
                      ? Icon(
                          Icons.person_rounded,
                          size: 38,
                          color: colorScheme.onPrimaryContainer,
                        )
                      : null,
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: colorScheme.primary, width: 2),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 14,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  profile.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withValues(
                      alpha: 0.60,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          IconButton(
            tooltip: context.t.profile.editName,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => EditNameDialog(
                  initialName: profile.name,
                  onSave: notifier.updateName,
                ),
              );
            },

            icon: Icon(
              Icons.edit_rounded,
              size: 19,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
