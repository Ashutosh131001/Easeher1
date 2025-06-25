import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text(
          "EaseHer Learning Hub",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 5,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 🩺 Phase Info Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "🌼 You’re in the Luteal Phase",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Mood swings and cravings may occur. Take extra care ❤️",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📊 Mini Stats for PCOS/PCOD
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildMiniStat("Common Symptom", "Irregular Periods"),
                  buildMiniStat("Awareness", "Only 50%"),
                  buildMiniStat("Impact", "1 in 5 Women"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✨ Quote
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.pink.shade100,
              ),
              child: const Text(
                "💫 “Your cycle is not a flaw, it's a rhythm of strength. Honor it.”",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),

            const SizedBox(height: 24),

            const Text("📚 PCOD & PCOS Articles",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),

            const SizedBox(height: 10),
            buildArticleCard("Understanding PCOD",
                "Symptoms, causes, and when to seek help."),
            buildArticleCard(
                "PCOD vs PCOS", "How they differ and why it matters."),
            buildArticleCard("Healthy Lifestyle Tips",
                "Foods, exercises & habits that help manage PCOS."),
          ],
        ),
      ),
    );
  }

  Widget buildMiniStat(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade100,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArticleCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Future: navigate to article detail
        },
      ),
    );
  }
}
