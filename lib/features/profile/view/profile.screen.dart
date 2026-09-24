import 'package:davai_store/core/widgets/hold_to_logout.dart';
import 'package:davai_store/features/profile/components/account_card.dart';
import 'package:davai_store/features/profile/components/more_card.dart';
import 'package:davai_store/features/profile/components/prefrences_card.dart';
import 'package:davai_store/features/profile/components/profile_header.dart';
import 'package:davai_store/features/profile/components/security_card.dart';
import 'package:davai_store/features/profile/provider/profile_provider.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              AccountCard(),
              PreferencesCard(),
              SecurityCard(),
              MoreCard(),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HoldToLogout(),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
