import 'package:davai_store/features/profile/components/account_card.dart';
import 'package:davai_store/features/profile/components/more_card.dart';
import 'package:davai_store/features/profile/components/more_section.dart';
import 'package:davai_store/features/profile/components/profile_header.dart';
import 'package:davai_store/features/profile/controller/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(profileProvider.notifier).loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: ProfileHeader()),

            SliverToBoxAdapter(child: AccountCard()),

            SliverToBoxAdapter(child: MoreSectionTitle()),

            SliverToBoxAdapter(child: MoreCard()),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
