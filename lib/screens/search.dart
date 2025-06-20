import 'package:flutter/material.dart';

class HealthTopic {
  final String title;
  final IconData icon;
  final String subtitle;

  HealthTopic({
    required this.title,
    required this.icon,
    required this.subtitle,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<HealthTopic> topics = [
    HealthTopic(
      title: "Cramps Relief Tips",
      icon: Icons.favorite,
      subtitle: "Ease the pain with natural methods",
    ),
    HealthTopic(
      title: "Understanding PCOD",
      icon: Icons.female,
      subtitle: "Know the symptoms and solutions",
    ),
    HealthTopic(
      title: "PMS Explained",
      icon: Icons.mood_bad,
      subtitle: "What to expect and how to cope",
    ),
    HealthTopic(
      title: "Bloating Remedies",
      icon: Icons.local_hospital,
      subtitle: "Tips to feel light and fresh",
    ),
    HealthTopic(
      title: "When to See a Doctor",
      icon: Icons.medical_services,
      subtitle: "Know when to seek help",
    ),
    HealthTopic(
      title: "Diet During Periods",
      icon: Icons.restaurant_menu,
      subtitle: "Foods that help reduce discomfort",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 5,
        title: const Text(
          "EaseHer Topics",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.pink),
                  hintText: "Search health topics...",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Tapped on ${topic.title}");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                topic.icon,
                                color: Colors.pink.shade600,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topic.title,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    topic.subtitle,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
