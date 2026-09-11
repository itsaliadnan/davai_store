// import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final forgotPasswordControllerProvider =
//     AsyncNotifierProvider<ForgotPasswordController, String>(
//       ForgotPasswordController.new,
//     );

// class ForgotPasswordController extends AsyncNotifier<String> {
//   late UserProvider userProvider;

//   @override
//   Future<String> build() async {
//     userProvider = ref.read(userApiProvider);

//     return '';
//   }

//   Future<void> sendOtp(String email) async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       final otp = await userProvider.forgotPassword(email);

//       return otp;
//     });
//   }
// }
