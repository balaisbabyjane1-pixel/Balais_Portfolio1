import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchEmail(String toEmail) async {
    final uri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {'subject': 'Portfolio Inquiry'},
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _launchPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.white),
              title: const Text(
                'babyjanebalais0@gmail.com',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () => _launchEmail('babyjanebalais0@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.white),
              title: const Text(
                '+63 912 345 6789',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () => _launchPhone('+639123456789'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.white),
              title: const Text(
                'Sta. Ana, Philippines',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
