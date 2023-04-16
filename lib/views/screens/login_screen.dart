import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tau/gen/assets.gen.dart';
import 'package:tau/services/mood_repo.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = useState(false);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Assets.tauLogo.svg(
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: isLoading.value
                ? const CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () async {
                      isLoading.value = true;
                      await ref.read(loginWithOAuthProvider.future);
                      // isLoading.value = false;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text('Login with Google'),
                  ),
          ),
        ],
      ),
    );
  }
}
