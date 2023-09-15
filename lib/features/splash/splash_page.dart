import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check authentication status
    // If authenticated, navigate to the home screen
    // If not authenticated, navigate to the sign-up screen

    // Example code (you should implement the actual authentication check):
    // if (authenticationStatus) {
    //   Navigator.of(context).pushReplacementNamed('/home');
    // } else {
    //   Navigator.of(context).pushReplacementNamed('/signup');
    // }

    return const Scaffold(
      body: Center(
          // child: CircularProgressIndicator(), // or your app's branding
          ),
    );
  }
}
