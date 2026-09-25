import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/home/presentation/components/search_bar.dart';
import 'package:davai_store/features/search/presentation/components/search_results_section.dart';
import 'package:davai_store/features/search/presentation/components/sorted_button.dart';
import 'package:davai_store/features/search/data/provider/search_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(searchResultsProvider);
    await ref.read(searchResultsProvider.future);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.profile.search)),

      body: RefreshIndicator(
        onRefresh: () => _onRefresh(ref),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchBarWidget(),
                SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.t.products.products,
                      style: context.text.titleMedium,
                    ),
                    SortByButton(
                      onSelected: (String value) {
                        ref.read(sortByProvider.notifier).state = value;
                      },
                    ),
                  ],
                ),

                SizedBox(height: AppSpacing.sm),
                const SearchResultsSection(),

                SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
