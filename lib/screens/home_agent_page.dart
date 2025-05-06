import 'package:flutter/material.dart';

class HomeAgentPage extends StatelessWidget {
  const HomeAgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil Agent')),
      body: const Center(
        child: Text(
          '✅ Connexion réussie\nBienvenue Agent 👨‍💼',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
