import 'package:flutter/material.dart';
import 'package:keep_note/screens/note_screen.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteScreen()));
      },
      onLongPress: () {
        // print('Long pressed');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Delete this note?'),
                  content: const Text(
                      'Delete this note? You won\'t be able to recover this note.'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          print("Note deletion proceed");
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          print("Note deletion abort");
                          Navigator.of(context).pop();
                        },
                        child: const Text('No')),
                  ],
                ));
      },
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
                child: const Text(
                  'Title',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                child: const Text(
                    'It was easy to spot her. All you needed to do was look at her socks. They were never a matching pair. One would be green while the other would be blue. One would reach her knee while the other barely touched her ankle. Every other part of her was perfect, but never the socks. They were her micro act of rebellion.',
                    style: TextStyle(
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
