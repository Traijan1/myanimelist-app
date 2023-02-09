import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Expandable extends StatefulWidget {
  final Widget child;
  final String title;
  const Expandable({super.key, required this.child, required this.title});

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 30,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Icon(_isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Theme.of(context).colorScheme.primaryContainer),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_isExpanded) widget.child
      ],
    );
  }
}
