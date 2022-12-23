import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app/wrapper.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'services/auth_services.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthService>(create: (_) => AuthService(),)
    ],
    child: MaterialApp(
      title: 'Login y Tokens',
      theme: ThemeData(
      primarySwatch: Colors.blue
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => Wrapper(),
        '/login':(context) => LoginScreen(),
        '/register':(context) => RegisterScreen(),
      },
    ),);
  }
}