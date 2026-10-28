// Fichier : lib/main.dart (Poker Academy MVP)
import 'package:flutter/material.dart';
import 'views/simulation_table_screen.dart';
import 'views/academy_lessons_screen.dart';

void main() {
  runApp(const PokerAcademyApp());
}

class PokerAcademyApp extends StatelessWidget {
  const PokerAcademyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        primaryColor: const Color(0xFFFACC15),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFACC15),
          secondary: const Color(0xFF3B82F6),
          surface: const Color(0xFF1F2937),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AgeGateScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.style, size: 80, color: Color(0xFFFACC15)),
            SizedBox(height: 20),
            Text(
              'POKER ACADEMY',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Color(0xFFF3F4F6),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Quinte Flush Royale à Cœur Validée',
              style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeGateScreen extends StatefulWidget {
  const AgeGateScreen({Key? key}) : super(key: key);

  @override
  State<AgeGateScreen> createState() => _AgeGateScreenState();
}

class _AgeGateScreenState extends State<AgeGateScreen> {
  final TextEditingController _dateController = TextEditingController();
  String errorMessage = '';

  void _verifyAge() {
    try {
      DateTime birthDate = DateTime.parse(_dateController.text);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      if (age < 18) {
        setState(() {
          errorMessage = "Accès strictement réservé aux majeurs (+18 ans).";
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = "Format de date invalide (AAAA-MM-JJ requis).";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vérification d'âge (+18)')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Entrez votre date de naissance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: 'AAAA-MM-JJ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFACC15)),
              onPressed: _verifyAge,
              child: const Text('Valider', style: TextStyle(color: Colors.black)),
            ),
            if (errorMessage.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(errorMessage, style: const TextStyle(color: Colors.redAccent)),
            ]
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Poker Academy - Hub')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bienvenue dans l'Académie', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Text('Bankroll Virtuelle', style: TextStyle(color: Color(0xFF9CA3AF))),
                    SizedBox(height: 8),
                    Text('100 EV-Chips', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFACC15))),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3B82F6)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SimulationTableScreen()),
                  );
                },
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text('Lancer la Table de Simulation', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1F2937)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AcademyLessonsScreen()),
                  );
                },
                icon: const Icon(Icons.school, color: Color(0xFFFACC15)),
                label: const Text('Modules Théoriques (Académie)', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
