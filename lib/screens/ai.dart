import 'package:flutter/material.dart';
import 'dart:math';

class ai extends StatefulWidget {
  const ai({super.key});

  @override
  State<ai> createState() => _aiState();
}

class _aiState extends State<ai> {
  final TextEditingController messagecontroller = TextEditingController();
  List<String> messages = ["AI: Hi, how can I help you?"];

  // List of period-related AI replies
  List<String> aiReplies = [
    "AI: Don't worry, you're doing great. Need a tip for cramps or mood swings?",
    "AI: Staying hydrated can help ease the discomfort. Want more tips?",
    "AI: A warm hug from me and a heating pad might do wonders!",
    "AI: Would you like to try some easy yoga poses for relief?",
    "AI: Do you want to track your symptoms or get a period-friendly diet suggestion?",
    "AI: It’s okay to rest — your body needs care too.",
    "AI: I’m here to support you. How are you feeling right now?",
  ];

  void newMessage() {
    String input = messagecontroller.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        messages.add("You: $input");

        var random = Random();
        var reply = aiReplies[random.nextInt(aiReplies.length)];

        messages.add(reply);
      });
      messagecontroller.clear();
    }
  }

  Widget buildMessageBubble(String msg) {
    bool isAI = msg.startsWith("AI:");

    return Align(
      alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isAI ? Colors.white : Colors.pink.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isAI ? Radius.circular(0) : Radius.circular(16),
            bottomRight: isAI ? Radius.circular(16) : Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          msg.replaceFirst("AI:", "").replaceFirst("You:", "").trim(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 5,
        title: const Text(
          "Personal AI",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessageBubble(messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messagecontroller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink),
                  onPressed: newMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
