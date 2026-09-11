// import 'dart:io';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileState {
//   final String name;
//   final String email;
//   final String? imagePath;

//   ProfileState({required this.name, required this.email, this.imagePath});

//   ProfileState copyWith({String? name, String? email, String? imagePath}) {
//     return ProfileState(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       imagePath: imagePath ?? this.imagePath,
//     );
//   }

//   File? get imageFile => imagePath != null ? File(imagePath!) : null;
// }

// class ProfileNotifier extends StateNotifier<ProfileState> {
//   ProfileNotifier(super.state) {
//     loadFromStorage(); // تحميل البيانات عند البداية
//   }

//   /// تحميل البيانات
//   Future<void> loadFromStorage() async {
//     final prefs = await SharedPreferences.getInstance();

//     final savedName = prefs.getString('name');
//     final savedImage = prefs.getString('image');

//     state = state.copyWith(
//       name: savedName ?? state.name,
//       imagePath: savedImage,
//     );
//   }

//   /// حفظ البيانات
//   Future<void> saveToStorage() async {
//     final prefs = await SharedPreferences.getInstance();

//     await prefs.setString('name', state.name);
//     if (state.imagePath != null) {
//       await prefs.setString('image', state.imagePath!);
//     }
//   }

//   /// اختيار صورة
//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.gallery);

//     if (picked != null) {
//       state = state.copyWith(imagePath: picked.path);
//       await saveToStorage(); // 🔥 حفظ
//     }
//   }

//   /// تحديث الاسم
//   void updateName(String newName) {
//     state = state.copyWith(name: newName);
//     saveToStorage(); // 🔥 حفظ
//   }
// }
