import 'package:flutter/material.dart';
import 'package:keep_note/screens/home_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NoteScreen();
}

class _NoteScreen extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white),
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
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Title'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    color: Colors.white,
                    child: const TextField(
                      maxLines: null,
                      decoration: InputDecoration(
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
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text('Add/ Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
