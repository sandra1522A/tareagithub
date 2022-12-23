import 'package:flutter/material.dart';
import 'package:flutter_login_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("Estas en el Home Screen"),
        Center(
          child: ElevatedButton(
            child: const Text("Logout"),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        )
      ],
      ),
    );
  }
}