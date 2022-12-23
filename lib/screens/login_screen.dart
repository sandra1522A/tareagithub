import 'package:flutter/material.dart';
import 'package:flutter_login_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              maxRadius: 80,
              backgroundImage:  NetworkImage("https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
               ),
               const SizedBox(
                height: 50,
               ),
               const Text(
                "LOGIN",
                style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Username or email address',
                          style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ],
                ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight:Radius.circular(10))),
                   //BorderRadius.circular(8))
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Password",

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Forgot Password",
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight:Radius.circular(10))),
                   // borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'),
            ),
           
          ],
        ),
      ),
    );
  }
}
