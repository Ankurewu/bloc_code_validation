import 'package:bloc_code_validation/screens/bloc/signin_bloc.dart';
import 'package:bloc_code_validation/screens/email_signinscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign in', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 75, 143, 231),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                // Add Google Sign-in logic here
                if (kDebugMode) {
                  print('Sign in with Google');
                }
              },
              color: Colors.blue,
              child: const Text(
                'Sign with Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SigninBloc(),
                            child: EmailsignInScreen(),
                          )),
                );
              },
              color: Colors.orange,
              child: const Text(
                'Sign with Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
