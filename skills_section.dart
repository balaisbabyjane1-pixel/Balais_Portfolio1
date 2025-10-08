import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'label': 'Flutter', 'icon': Icons.flutter_dash},
      {'label': 'Dart', 'icon': Icons.code},
      {'label': 'ReactJS', 'icon': Icons.web},
      {'label': 'Networking', 'icon': Icons.network_check},
      {'label': 'Research', 'icon': Icons.menu_book},
      {'label': 'Teamwork', 'icon': Icons.group},
    ];

    return Card(
      color: Colors.white.withOpacity(0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 58, 57, 57),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills.map((s) {
                return Chip(
                  avatar: Icon(
                    s['icon'] as IconData,
                    size: 18,
                    color: const Color.fromARGB(179, 27, 27, 27),
                  ),
                  label: Text(
                    s['label'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 253, 253),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(
                    255,
                    57,
                    55,
                    55,
                  ).withOpacity(0.12),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
