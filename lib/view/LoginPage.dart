import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_demo/controller/Riverpod_Manager.dart';
import 'package:voco_demo/sevices/AuthService.dart';
import 'package:voco_demo/view/HomePage.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.asset("assets/images/logo.jpg"),
              TextField(
                controller: ref.read(authController).email,
                decoration: const InputDecoration(label: Text("Email")),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                controller: ref.read(authController).password,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool result = await ref.read(authController).login();

                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Kayıt Başarılı")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Kayıt Hatalı")));
                    }
                  },
                  child: const Text("Register")),
              ElevatedButton(
                  onPressed: () async {
                    bool result = await ref.read(authController).login();
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Giriş Başarılı")));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Giriş Hatalı")));
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
