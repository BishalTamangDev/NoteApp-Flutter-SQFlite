import 'package:flutter/material.dart';
import 'package:keep_note/models/note_model.dart';
import 'package:keep_note/screens/home_screen.dart';
import 'package:keep_note/services/database_helper.dart';

class NoteScreen extends StatefulWidget {
  final NoteModel? note;

  const NoteScreen({this.note, super.key});

  @override
  State<StatefulWidget> createState() => _NoteScreen();
}

class _NoteScreen extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if(widget.note != null){
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.note == null ? "Add Note" : "Edit Note",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: descriptionController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                color: Colors.transparent,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        descriptionController.text.isEmpty) {
                      return;
                    }

                    final NoteModel note = NoteModel(
                        title: titleController.text,
                        description: descriptionController.text, id: widget.note?.id);

                    if (widget.note == null) {
                      DatabaseHelper.addNote(note);
                    } else {
                      DatabaseHelper.updateNote(note);
                    }
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: Text(widget.note == null ? "Add" : "Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
