import 'package:flutter/material.dart';
import 'package:flutter_login_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 100,
                backgroundImage: NetworkImage("https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
                 ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
            ),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () async{
                   await authService.createUserWithEmailandPassword(
                      emailController.text,
                      passwordController.text);
                      Navigator.pop(context);
                },
                child: Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
