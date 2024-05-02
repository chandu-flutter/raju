import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/Bible/english_bible/bible_helper.dart';

import 'package:thandri_sannidhi/Bible/english_bible/verse.dart';

class Chapters extends StatefulWidget {
  final List data;

  const Chapters(this.data, {super.key});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  EngBibleHelper enghelper = EngBibleHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 54, 1, 63),
          title: const Text(''),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Chapter ${index + 1}',
                            style: const TextStyle(fontSize: 18),
                          ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Verse(widget.data[index]['Verse'])),
                    );
                  },
                );
              }),
        ));
  }
}
