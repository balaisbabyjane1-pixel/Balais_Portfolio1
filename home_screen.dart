import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/profile_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final List<Project> projects;
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    projects = [
      Project(
        title: 'Language Learning Web System',
        description:
            'Interactive language-learning platform built with web technologies.',
        githubUrl: 'https://github.com/yourusername/language-learning',
      ),
      Project(
        title: 'Discrete Math Interactive Program',
        description:
            'Educational app demonstrating counting theory & recurrence relations.',
        githubUrl: 'https://github.com/yourusername/discrete-math',
      ),
      Project(
        title: 'ReactJS Topic Presentation',
        description:
            'A ReactJS mini-site demonstrating components, props and hooks.',
        githubUrl: 'https://github.com/yourusername/reactjs-presentation',
      ),
    ];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  EdgeInsets contentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 900)
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 40);
    if (width > 600)
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 30);
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.themeMode == ThemeMode.dark
                ? [Colors.grey.shade900, Colors.black]
                : [Colors.teal.shade600, Colors.teal.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fade,
            child: SingleChildScrollView(
              padding: contentPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // top bar with title and toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Portfolio',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            tooltip: 'Toggle theme',
                            onPressed: widget.onToggleTheme,
                            icon: Icon(
                              widget.themeMode == ThemeMode.dark
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Layout: On wide screens show two-column layout; on mobile single column
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final wide = constraints.maxWidth > 900;
                      return wide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // left column (profile + skills)
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      ProfileSection(),
                                      const SizedBox(height: 20),
                                      const AboutSection(),
                                      const SizedBox(height: 20),
                                      const SkillsSection(),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 30),

                                // right column (projects + contact)
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    children: [
                                      ProjectsSection(projects: projects),
                                      const SizedBox(height: 20),
                                      const ContactSection(),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                ProfileSection(),
                                const SizedBox(height: 16),
                                const AboutSection(),
                                const SizedBox(height: 16),
                                const SkillsSection(),
                                const SizedBox(height: 16),
                                ProjectsSection(projects: projects),
                                const SizedBox(height: 16),
                                const ContactSection(),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
