import 'dart:io';

import 'package:davai_store/features/auth/data/model/user_session.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// =========================
// Provider
// =========================
final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((
  ref,
) {
  final api = ref.read(userApiProvider);
  final session = ref.read(userSessionControllerProvider);

  return ProfileNotifier(api, session);
});
// =========================
// State
// =========================

class ProfileState {
  final int userId;
  final String name;
  final String email;
  final String? imageUrl;
  final File? imageFile;
  final bool isLoading;

  ProfileState({
    required this.userId,
    required this.name,
    required this.email,
    this.imageUrl,
    this.imageFile,
    this.isLoading = false,
  });

  factory ProfileState.initial() {
    return ProfileState(
      userId: 0,
      name: '',
      email: '',
      imageUrl: null,
      imageFile: null,
      isLoading: false,
    );
  }

  ProfileState copyWith({
    int? userId,
    String? name,
    String? email,
    String? imageUrl,
    File? imageFile,
    bool? isLoading,
  }) {
    return ProfileState(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      imageFile: imageFile ?? this.imageFile,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// =========================
// Notifier
// =========================

class ProfileNotifier extends StateNotifier<ProfileState> {
  final UserProvider api;
  final UserSession? session;

  ProfileNotifier(this.api, this.session) : super(ProfileState.initial());

  // =========================
  // Load Profile
  // =========================
  Future loadProfile() async {
    try {
      state = state.copyWith(isLoading: true);

      if (session == null) {
        throw Exception('User session not found');
      }

      final user = await api.getCurrentUser(session!.userId);

      state = state.copyWith(
        userId: user.id,
        name: user.name,
        email: user.email,
        imageUrl: user.imageUrl,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
  // =========================
  // Update Name
  // =========================

  Future updateName(String name) async {
    try {
      state = state.copyWith(isLoading: true);

      await api.updateProfile(userId: state.userId, name: name);

      state = state.copyWith(name: name, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);

      rethrow;
    }
  }

  // =========================
  // Pick Image
  // =========================

  Future<File?> pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (picked == null) {
      return null;
    }

    return File(picked.path);
  }

  // =========================
  // Upload Image
  // =========================

  Future updateImage(File file) async {
    try {
      state = state.copyWith(imageFile: file, isLoading: true);

      final imageUrl = await api.uploadProfileImage(file, state.userId);

      // 2️REST → users.image_url
      await api.updateProfile(
        userId: state.userId,
        name: state.name,
        imageUrl: imageUrl,
      );

      // تحديث الحالة
      state = state.copyWith(
        imageUrl: imageUrl,
        imageFile: null,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);

      rethrow;
    }
  }

  // =========================
  // Pick + Upload
  // =========================

  Future pickImageAndUpload() async {
    final file = await pickImage();

    if (file == null) {
      return;
    }

    await updateImage(file);
  }
}
