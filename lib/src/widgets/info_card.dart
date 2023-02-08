import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? leading;

  const InfoCard({super.key, required this.title, required this.value, this.leading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (leading != null) Icon(leading!, size: 20),
            const SizedBox(width: 10),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}
