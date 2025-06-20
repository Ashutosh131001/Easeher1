import 'package:flutter/material.dart';

// Data model for community post
class Community {
  final String title;
  final IconData icon;
  final String subtitle;

  Community({
    required this.title,
    required this.icon,
    required this.subtitle,
  });
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _controller = TextEditingController();
  void showadd() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add New Post'),
            content: TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: "Write your Message", border: OutlineInputBorder()),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    final message = _controller.text.trim();
                    if (message.isNotEmpty) {
                      setState(() {
                        topics.insert(
                            0,
                            Community(
                                title: 'You',
                                icon: Icons.person,
                                subtitle: message));
                      });
                      _controller.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('  post'))
            ],
          );
        });
  }

  final List<Community> topics = [
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "I recently started using mindfulness techniques, and it has helped me manage my stress during my periods. Anyone else has tips to share?",
    ),
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "Remember to stay hydrated! It can help reduce cramps and improve your overall mood during your cycle.",
    ),
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "I've been doing light yoga during my period, and it makes a huge difference. Highly recommend trying it!",
    ),
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "Does anyone have quick, easy recipes that are period-friendly? I love experimenting in the kitchen!",
    ),
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "I've been doing light yoga during my period, and it makes a huge difference. Highly recommend trying it!",
    ),
    Community(
      title: "Ashutosh",
      icon: Icons.person,
      subtitle:
          "I've been doing light yoga during my period, and it makes a huge difference. Highly recommend trying it!",
    ),
    // Add more entries if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 5,
        title: const Text(
          "EaseHer Community",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink.shade100,
                        child: Icon(topic.icon, color: Colors.pink.shade600),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        topic.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    topic.subtitle,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.favorite_border,
                          size: 20, color: Colors.pink.shade300),
                      const SizedBox(width: 4),
                      const Text("Like"),
                      const SizedBox(width: 20),
                      Icon(Icons.comment_outlined,
                          size: 20, color: Colors.pink.shade300),
                      const SizedBox(width: 4),
                      const Text("Comment"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showadd();
        },
        backgroundColor: Colors.pink.shade400,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
