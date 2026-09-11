import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),

      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.sm),

      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,

        borderRadius: BorderRadius.circular(AppSpacing.lg),

        border: Border.all(
          color: isFocused
              ? context.colorScheme.primary
              : context.colorScheme.shadow,
          width: isFocused ? 2.5 : 1.5,
        ),
      ),

      child: Row(
        children: [
          Icon(Icons.search, color: context.colorScheme.onPrimary),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: TextField(
              focusNode: _focusNode,

              cursorColor: context.colorScheme.primary,
              style: context.text.bodyMedium,
              decoration: InputDecoration(
                hintText: context.t.home.searchProduct,
                hintStyle: context.text.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.5,
                  ),
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          Container(
            height: 24,
            width: 36,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(AppSpacing.sm),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              icon: SvgPicture.asset(
                'assets/icons/filter.svg',
                height: 14,
                width: 14,
                colorFilter: ColorFilter.mode(
                  context.colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
