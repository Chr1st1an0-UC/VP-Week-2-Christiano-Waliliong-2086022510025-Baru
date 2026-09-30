import 'package:flutter/material.dart';
import 'screens/tcg_vault_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCG Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TcgVaultScreen(),
    );
  }
}