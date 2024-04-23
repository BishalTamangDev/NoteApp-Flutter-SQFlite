import 'package:flutter/material.dart';
import 'package:keep_note/models/note_model.dart';
import 'package:keep_note/screens/note_screen.dart';

class NoteWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final NoteModel note;

  const NoteWidget(
      {required this.note,
      required this.onTap,
      required this.onLongPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  note.title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                width: double.infinity,
                color: Colors.transparent,
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  note.description,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
