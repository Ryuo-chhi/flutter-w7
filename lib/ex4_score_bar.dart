import 'package:flutter/material.dart';

// EX 4 – Score bar (BONUS, free style: handout page EX 4)
// The design, the widgets and the data are up to you.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: Colors.lightGreen,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              ScoreBar(
                title: "Flutter",
              ),
              ScoreBar(
                title: "Dart",
              ),
              ScoreBar(
                title: "React",
              ),
            ],
          ),
        ),
      )),
    ),
  );
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int _score = 0;

  void _add() {
    setState(() {
      _score += _score < 10 ? 1 : 0;
    });
  }

  void _minus() {
    setState(() {
      _score -= _score > 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 24,
          children: [
            Text(
              "My score in ${widget.title}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: _minus, icon: Icon(Icons.remove)),
                IconButton(onPressed: _add, icon: Icon(Icons.add))
              ],
            ),
            Stack(
              children: [
                // Layer 1: the border track (full width)
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Layer 2: the green fill
                FractionallySizedBox(
                  widthFactor: _score / 10, // 0.0 → 1.0, computed from score
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                     color: Color.lerp(Colors.green[200], Colors.green[800], _score / 10)!,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
