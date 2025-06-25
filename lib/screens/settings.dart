import 'package:flutter/material.dart';

class EaseHerSettings extends StatelessWidget {
  const EaseHerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        elevation: 5,
        title: const Text(
          "EaseHer Menu",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Name & Email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ashutosh Bhardwaj",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("ashutoshbhardwaj822026@gmail.com",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 20),

          // Get Premium
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("💖 Get EaseHer Premium",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Mode Card
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Mode: Period Tracking",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 16),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _sectionTitle("Health profile"),
          _settingsTile("My health record"),
          _settingsTile("Birth Control"),

          const SizedBox(height: 25),

          _sectionTitle("App preferences"),
          _settingsTile("Appearance"),
          _settingsTile("Customize tracking"),
          _settingsTile("Reminders and notifications"),
          _settingsTile("EaseHer Settings"),
          _settingsTile("Partner Connect"),

          const SizedBox(height: 25),

          _sectionTitle("Resources"),
          _settingsTile("Tracking guidance"),

          const SizedBox(height: 30),
          Center(
            child: Text("EaseHer v1.0.0",
                style: TextStyle(color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _settingsTile(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.pink),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {
          // Add navigation or functionality
        },
      ),
    );
  }
}
