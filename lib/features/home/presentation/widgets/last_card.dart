import 'package:flutter/material.dart';

class LastCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const LastCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title)],
          ),
        ),
      ),
    );
  }
}
