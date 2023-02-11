import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myanimelist/src/models/myanimelist/anime_info_entry.dart';
import 'package:myanimelist/src/models/myanimelist/my_list_status.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';

class EditEntryPage extends StatefulWidget {
  static const String route = "/editEntry";
  final AnimeInfoEntry entry;
  const EditEntryPage({super.key, required this.entry});

  @override
  State<EditEntryPage> createState() => _EditEntryPageState();
}

class _EditEntryPageState extends State<EditEntryPage> {
  late TextEditingController progressController;
  late TextEditingController scoreController;
  String status = "";

  void save() {
    MyAnimeListService.saveAnimeEntry(
      widget.entry.id,
      status,
      progressController.text,
      scoreController.text,
    );

    if (widget.entry.myListStatus != null) {
      widget.entry.myListStatus!.status = status;
      widget.entry.myListStatus!.numEpisodesWatched = int.parse(progressController.text);
      widget.entry.myListStatus!.score = int.parse(scoreController.text);
    } else {
      widget.entry.myListStatus = MyListStatus(
        status,
        int.parse(progressController.text),
        int.parse(scoreController.text),
        false,
        null,
        null,
        null,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    var progress = "0";
    var score = "0";

    if (widget.entry.myListStatus != null) {
      progress = widget.entry.myListStatus!.numEpisodesWatched.toString();
      score = widget.entry.myListStatus!.score.toString();
      status = widget.entry.myListStatus!.status!;
    }

    progressController = TextEditingController(text: progress);
    scoreController = TextEditingController(text: score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.entry.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text("Status: "),
            const SizedBox(height: 10),
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 7.5,
                mainAxisSpacing: 7.5,
                childAspectRatio: 3,
              ),
              shrinkWrap: true,
              children: [
                StatusButton(
                  currentStatus: status,
                  text: "Watching",
                  status: "watching",
                  onClick: (status) => setState(() => this.status = status),
                ),
                StatusButton(
                  currentStatus: status,
                  text: "Completed",
                  status: "completed",
                  onClick: (status) => setState(() => this.status = status),
                ),
                StatusButton(
                  currentStatus: status,
                  text: "Plan to Watch",
                  status: "plan_to_watch",
                  onClick: (status) => setState(() => this.status = status),
                ),
                StatusButton(
                  currentStatus: status,
                  text: "On Hold",
                  status: "on_hold",
                  onClick: (status) => setState(() => this.status = status),
                ),
                StatusButton(
                  currentStatus: status,
                  text: "Dropped",
                  status: "dropped",
                  onClick: (status) => setState(() => this.status = status),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Progress:"),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: progressController,
                            ),
                          ),
                          Text('/ ${widget.entry.numEpisodes}'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Score:"),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: scoreController,
                            ),
                          ),
                          const Text('/ 10'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(onPressed: save, child: const Text("Save")),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: save,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onErrorContainer),
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
