import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myanimelist/src/models/myanimelist/anime_info_entry.dart';
import 'package:myanimelist/src/models/myanimelist/my_list_status.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';

import '../widgets/status_button.dart';

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
  bool showAlertDialogue = false;
  bool showDeleteButton = false;

  void save() {
    if (status.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Set a status before save",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      );
      return;
    }

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

      setState(() => showDeleteButton = true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Sucessfully updated entry",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      );
    }
  }

  void delete() {
    MyAnimeListService.deleteAnimeEntry(widget.entry.id);
    setState(() {
      showAlertDialogue = false;
      showDeleteButton = false;
      widget.entry.myListStatus = null;
      status = "";
    });
  }

  @override
  void initState() {
    super.initState();

    var progress = 0;
    var score = 0;

    if (widget.entry.myListStatus != null) {
      progress = widget.entry.myListStatus!.numEpisodesWatched;
      score = widget.entry.myListStatus!.score;
      status = widget.entry.myListStatus!.status!;
      setState(() => showDeleteButton = true);
    }

    progressController = TextEditingController(text: progress.toString());
    scoreController = TextEditingController(text: score.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
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
                      if (showDeleteButton) ...[
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => setState(() => showAlertDialogue = true),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.error),
                          child: const Text("Delete"),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
            if (showAlertDialogue)
              Align(
                alignment: Alignment.center,
                child: AlertDialog(
                  title: const Text("Delete anime from list?"),
                  content:
                      const Text("Are you sure, you want to delete this anime from your list?"),
                  actions: [
                    ElevatedButton(
                      onPressed: delete,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error),
                      child: const Text("Delete"),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondary),
                        onPressed: () => setState(() => showAlertDialogue = false),
                        child: const Text("Cancel")),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
