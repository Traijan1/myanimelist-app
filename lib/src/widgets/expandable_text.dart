import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  late TextPainter tp;
  static const int maxLines = 4;

  @override
  void initState() {
    super.initState();
    tp = TextPainter(
        text: TextSpan(text: widget.text), maxLines: maxLines, textDirection: TextDirection.ltr);
    tp.layout();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Column(
        children: [
          Text(
            widget.text,
            maxLines: _isExpanded ? null : maxLines,
          ),
          if (tp.didExceedMaxLines) ...[
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                alignment: Alignment.center,
                child: Icon(_isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            )
          ]
        ],
      ),
    );
  }
}
