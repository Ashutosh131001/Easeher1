import 'package:flutter/material.dart';

class MenSupportPage extends StatelessWidget {
  const MenSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text(
          'For Men',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink.shade300,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            supportCard(
              title: 'How You Can Help',
              tips: [
                'Offer emotional support — just be there.',
                'Encourage her to rest and stay hydrated.',
                'Help with household tasks.',
                'Keep snacks or hot water bags ready.',
              ],
              icon: Icons.favorite,
              color: Colors.green.shade400,
            ),
            supportCard(
              title: 'What Not to Do',
              tips: [
                'Avoid saying "It’s not a big deal".',
                'Don’t joke or make fun of her pain.',
                'Don’t force her to socialize if she wants rest.',
                'Avoid comparing her symptoms to others.',
              ],
              icon: Icons.block,
              color: Colors.red.shade300,
            ),
            supportCard(
              title: 'Comforting Words',
              tips: [
                '"I’m here for you."',
                '"It’s okay to rest today."',
                '"You’re strong, and I admire you."',
                '"Do you need anything right now?"',
              ],
              icon: Icons.chat,
              color: Colors.purple.shade300,
            ),
            supportCard(
              title: 'Myths Busted',
              tips: [
                '❌ Myth: Periods are dirty → ✅ Truth: It’s natural and clean.',
                '❌ Myth: Mood swings = drama → ✅ Truth: Hormones cause real shifts.',
                '❌ Myth: Girls fake pain → ✅ Truth: Cramps can be intense.',
              ],
              icon: Icons.lightbulb,
              color: Colors.orange.shade300,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget supportCard({
    required String title,
    required List<String> tips,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 26, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...tips.map(
            (tip) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline,
                      size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tip,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
