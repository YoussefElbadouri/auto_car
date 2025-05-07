import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'home_agent_page.dart'; // 👈 Ajout import

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage;

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final result = await ApiService.login(email, password);

    if (result == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeAgentPage()), // 👈 Redirection
      );
    } else {
      setState(() {
        errorMessage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion Agent')),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Se connecter'),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(errorMessage!,
                      style: const TextStyle(color: Colors.red)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
