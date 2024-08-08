import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(scopes: ['email']);
});

class UserState {
  final String? id;
  final String? fullname;
  final String? email;

  UserState({this.id, this.fullname, this.email});
}

class UserNotifier extends StateNotifier<UserState?> {
  UserNotifier() : super(null);

  Future<void> signInWithGoogle(GoogleSignIn googleSignIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final user = await googleSignIn.signIn();
      if (user != null && user.email != null) {
        bool userExists = false;
        if (!userExists) {
          userExists = true;
        }
        if (userExists) {
          const userId = "mockUserId";
          final fullname = user.displayName ?? "Unknown";
          final email = user.email;

          state = UserState(id: userId, fullname: fullname, email: email);

          await prefs.setString('id', userId);
          await prefs.setString('fullname', fullname);
          await prefs.setString('email', email);
        }
      }
    } catch (error) {
      print('Error signing in: $error');
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState?>((ref) {
  return UserNotifier();
});

class GoogleSign extends HookConsumerWidget {
  const GoogleSign({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleSignIn = ref.read(googleSignInProvider);
    final userNotifier = ref.read(userProvider.notifier);

    return InkWell(
      onTap: () async {
        await userNotifier.signInWithGoogle(googleSignIn);
        final userState = ref.read(userProvider);
        if (userState != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
