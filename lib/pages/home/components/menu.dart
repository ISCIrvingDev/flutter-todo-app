import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 32, 32, 32),
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                'Todo App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'About Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              launchUrl(Uri.parse('https://www.ingenious-development.net/'));
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Contact Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              launchUrl(Uri.parse('mailto:ISCIrvingDev@gmail.com'));
            },
          ),
        ],
      ),
    );
  }
}
