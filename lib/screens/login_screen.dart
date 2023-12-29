import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_docs_clone_flutter/colors.dart";
import "package:google_docs_clone_flutter/repository/auth_repository.dart";

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signWithGoogle(WidgetRef ref) {
    ref.read(authRepositoryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef is used to access the provider and its value and to rebuild the widget when the provider value changes.
    // when should we use ref.watch and ref.read?  ref.watch is used when we want to rebuild the widget when the provider value changes. ref.read is used when we want to access the provider value but don't want to rebuild the widget when the provider value changes.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Google Docs Clone"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            signWithGoogle(ref);
          },
          icon: Image.asset(
            "assets/images/g-logo-2.png",
            height: 20,
          ),
          label: Text(
            "Sign in with Google",
            style: TextStyle(
                color: colorBlack.withOpacity(0.73),
                fontWeight: FontWeight.bold,
                fontSize: 15.2),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: colorWhite.withOpacity(0.6),
              minimumSize: const Size(150, 50)),
        ),
      ),
    );
  }
}
