// Fichier : lib/views/simulation_table_screen.dart
import 'package:flutter/material.dart';

class SimulationTableScreen extends StatefulWidget {
  const SimulationTableScreen({Key? key}) : super(key: key);

  @override
  State<SimulationTableScreen> createState() => _SimulationTableScreenState();
}

class _SimulationTableScreenState extends State<SimulationTableScreen> {
  double _raiseSliderValue = 300.0;
  bool _isProfesorFrozen = false;

  void _triggerError() {
    setState(() {
      _isProfesorFrozen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text('Table de Tournoi (SNG 6-max)'),
        backgroundColor: const Color(0xFF1F2937),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'Bankroll: 100 EV-Chips',
                style: TextStyle(color: Color(0xFFFACC15), fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                color: const Color(0xFF1F2937).withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Niveau : 100 / 200 (Ante 25)', style: TextStyle(color: Color(0xFF9CA3AF))),
                    Text('Pot total : 450 jetons', style: TextStyle(color: Color(0xFFF3F4F6), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 320,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(110),
                      border: Border.all(color: const Color(0xFF3B82F6), width: 2),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left: 40,
                          child: _buildBotBadge("Vilain Maniac", "21 BB", Colors.redAccent),
                        ),
                        Positioned(
                          top: 15,
                          right: 40,
                          child: _buildBotBadge("Vilain Nit", "12 BB", Colors.blueAccent),
                        ),
                        Positioned(
                          right: 10,
                          top: 90,
                          child: _buildBotBadge("Calling Station", "35 BB", Colors.greenAccent),
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              _CardWidget(card: "9♥"),
                              SizedBox(width: 4),
                              _CardWidget(card: "8♠"),
                              SizedBox(width: 4),
                              _CardWidget(card: "2♦"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1F2937),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Vos cartes : ', style: TextStyle(color: Color(0xFF9CA3AF))),
                        _CardWidget(card: "A♦", isHero: true),
                        SizedBox(width: 6),
                        _CardWidget(card: "Q♠", isHero: true),
                        SizedBox(width: 15),
                        Text('Stack : 2400 (12 BB)', style: TextStyle(color: Color(0xFFF3F4F6), fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Slider(
                      value: _raiseSliderValue,
                      min: 100,
                      max: 2400,
                      divisions: 23,
                      activeColor: const Color(0xFFFACC15),
                      inactiveColor: Colors.grey,
                      label: '${_raiseSliderValue.toInt()} jetons',
                      onChanged: (double value) {
                        setState(() {
                          _raiseSliderValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800),
                          onPressed: _triggerError,
                          child: const Text('Fold', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
                          onPressed: _triggerError,
                          child: const Text('Call 200', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFACC15)),
                          onPressed: _triggerError,
                          child: Text('Raise ${_raiseSliderValue.toInt()}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isProfesorFrozen)
            Container(
              color: Colors.black87,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2937),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.redAccent, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 50),
                      const SizedBox(height: 12),
                      const Text(
                        'STOP. ERREUR CRITIQUE !',
                        style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Tu fais un C-Bet plein pot sur un board connecté face à une Calling Station. Ton EV s'effondre.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFF3F4F6), fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Ce qu'il fallait faire : Check pour contrôler la taille du pot.\n(-15 EV-Chips)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFFACC15), fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFACC15)),
                        onPressed: () {
                          setState(() {
                            _isProfesorFrozen = false;
                          });
                        },
                        child: const Text('J'ai compris, je corrige', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBotBadge(String name, String stack, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        children: [
          Text(name, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
          Text(stack, style: const TextStyle(fontSize: 11, color: Colors.white)),
        ],
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final String card;
  final bool isHero;
  const _CardWidget({Key? key, required this.card, this.isHero = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isRed = card.contains('♥') || card.contains('♦');
    bool isSpade = card.contains('♠');
    
    Color suitColor = isRed ? Colors.red : (isSpade ? Colors.black : Colors.green);
    if (isHero) suitColor = isRed ? Colors.redAccent : Colors.white;

    return Container(
      width: isHero ? 36 : 28,
      height: isHero ? 50 : 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          card,
          style: TextStyle(fontSize: isHero ? 14 : 11, fontWeight: FontWeight.bold, color: suitColor),
        ),
      ),
    );
  }
}
