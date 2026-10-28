// Fichier : lib/views/academy_lessons_screen.dart
import 'package:flutter/material.dart';

class AcademyLessonsScreen extends StatelessWidget {
  const AcademyLessonsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> lessons = const [
    {
      "title": "1. Le C-Bet (Continuation Bet) au Flop",
      "category": "Micro Stakes",
      "description": "Apprenez quand et pourquoi miser au flop après avoir agressé pré-flop, en fonction de la texture du board et du profil de vilain.",
      "status": "Débloqué"
    },
    {
      "title": "2. L'Isolation en Position",
      "category": "Micro Stakes",
      "description": "Comment punir les limpers et resserrer votre range d'open-raise pour prendre l'initiative en heads-up post-flop.",
      "status": "Débloqué"
    },
    {
      "title": "3. Push / Fold Short-Stack (ICM)",
      "category": "Mid Stakes",
      "description": "Maîtrisez les tables de Nash et la pression de la bulle en tournoi lorsque votre tapis descend sous les 15 Big Blinds.",
      "status": "Verrouillé (Nécessite 2,500 EV-Chips)"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text('Académie - Modules Théoriques'),
        backgroundColor: const Color(0xFF1F2937),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          bool isUnlocked = lesson["status"] == "Débloqué";

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isUnlocked ? const Color(0xFF3B82F6) : Colors.grey.shade800,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lesson["category"]!,
                      style: const TextStyle(
                        color: Color(0xFFFACC15),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      lesson["status"]!,
                      style: TextStyle(
                        color: isUnlocked ? Colors.greenAccent : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  lesson["title"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF3F4F6),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  lesson["description"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isUnlocked ? const Color(0xFFFACC15) : Colors.grey.shade800,
                    ),
                    onPressed: isUnlocked ? () {} : null,
                    child: Text(
                      isUnlocked ? 'Lancer le cours' : 'Verrouillé',
                      style: TextStyle(
                        color: isUnlocked ? Colors.black : Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
