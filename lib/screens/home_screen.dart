import 'package:flutter/material.dart';
import 'package:keep_note/screens/note_screen.dart';

import '../widgets/note_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Keep Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return NoteWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoteScreen()));
                },
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete this note?'),
                          content: const Text('You won\'t be able to retrieve this later.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  print('Note deletion proceed.');
                                  Navigator.of(context).pop();
                                }, child: const Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  print('Note deletion abort.');
                                  Navigator.of(context).pop();
                                }, child: const Text('No')),
                          ],
                        );
                      });
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          //   navigate to another screen -> Add Note Screen
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NoteScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
