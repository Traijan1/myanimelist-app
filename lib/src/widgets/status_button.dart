import 'package:flutter/material.dart';

class StatusButton extends StatefulWidget {
  final String currentStatus;
  final String text;
  final String status;
  final Function(String) onClick;
  const StatusButton(
      {super.key,
      required this.currentStatus,
      required this.text,
      required this.status,
      required this.onClick});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  bool currentStatus = false;
  late ButtonStyle inactiveButton;

  @override
  void initState() {
    super.initState();
    currentStatus = widget.status == widget.currentStatus;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    inactiveButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.primary,
      side: BorderSide(
        width: 1,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatusButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentStatus = widget.status == widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: currentStatus ? null : inactiveButton,
      onPressed: () => widget.onClick(widget.status),
      child: Text(widget.text),
    );
  }
}
