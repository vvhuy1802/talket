import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:talket/domain/model/authen/login_response.dart';

import '../chat/providers/auth_providers.dart';
import '../chat/providers/states/auth_state.dart';

@RoutePage()
class DemoLogin extends ConsumerStatefulWidget {
  const DemoLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DemoLoginState();
}

class _DemoLoginState extends ConsumerState<DemoLogin> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authStateNotifierProvider);
    ref.listen(
      authStateNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        }
      }),
    );
    return KeyboardDismisser(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: state is Success
                  ? loginSuccess(state.data?.user, ref)
                  : loginForm(
                      context, ref, emailController, passwordController),
            ),
            if (state is Loading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget loginSuccess(User? user, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 48),
        const SizedBox(height: 16),
        Text('Welcome, ${user?.email}', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        Text('ID: ${user?.id}'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            ref.read(authStateNotifierProvider.notifier).reset();
          },
          child: const Text("Reset Login State"),
        ),
      ],
    ),
  );
}

Widget loginForm(
    BuildContext context,
    WidgetRef ref,
    TextEditingController emailController,
    TextEditingController passwordController,
    ) {
  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: emailController,
          decoration: buildInputDecoration('Email', Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: buildInputDecoration('Password', Icons.lock),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ref.read(authStateNotifierProvider.notifier).loginUser(
                emailController.text.trim(),
                passwordController.text,
              );
            },
            child: const Text(
              'Log In',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

