import 'dart:async';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/search/presentation/provider/search_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget({super.key});

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (!mounted) return;
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(searchQueryProvider.notifier).state = value;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(
          color: isFocused
              ? context.colorScheme.onSurfaceVariant
              : context.colorScheme.primary,
          width: isFocused ? 2.5 : 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: context.colorScheme.onSurface),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: _onSearchChanged,
              onTapOutside: (_) {
                _focusNode.unfocus();
              },
              cursorColor: context.colorScheme.primary,
              style: context.text.bodyMedium,
              decoration: InputDecoration(
                hintText: context.t.searchBar.searchProduct,
                hintStyle: context.text.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.5,
                  ),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                filled: false,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          // Container(
          //   height: 24,
          //   width: 36,
          //   decoration: BoxDecoration(
          //     color: context.colorScheme.surfaceContainer,
          //     borderRadius: BorderRadius.circular(AppSpacing.sm),
          //   ),
          //   child: IconButton(
          //     padding: EdgeInsets.zero,
          //     iconSize: 18,
          //     icon: SvgPicture.asset(
          //       'assets/icons/filter.svg',
          //       height: 14,
          //       width: 14,
          //       colorFilter: ColorFilter.mode(
          //         context.colorScheme.onSurfaceVariant,
          //         BlendMode.srcIn,
          //       ),
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
