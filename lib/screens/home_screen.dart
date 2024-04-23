import 'package:flutter/material.dart';
import 'package:keep_note/models/note_model.dart';
import 'package:keep_note/screens/note_screen.dart';
import 'package:keep_note/services/database_helper.dart';

import '../widgets/note_widget.dart';

class HomeScreen extends StatefulWidget {
  final NoteModel? note;

  const HomeScreen({this.note, super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }
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
      body: FutureBuilder<List<NoteModel>?>(
        future: DatabaseHelper.getAllNotes(),
        builder: (context, AsyncSnapshot<List<NoteModel>?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else if(snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return NoteWidget(
                      note: snapshot.data![index],
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen(note: snapshot.data![index])));
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete this note?'),
                              content: const Text(
                                  'You won\'t be able to retrieve this later.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      DatabaseHelper.deleteNote(snapshot.data![index]);
                                      print('Note deletion proceed.');
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      print('Note deletion abort.');
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    child: const Text('No')),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }else{
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You haven\'t added any note yet!'),
                ],
              ),
            );
          }
        },
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
