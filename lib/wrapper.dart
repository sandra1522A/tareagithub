import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/screens.dart';
import 'services/auth_services.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if (snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? const LoginScreen() : const HomeScreen();
        } else{
          return const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
            ),
            );
        }
      },
    );
  }
}