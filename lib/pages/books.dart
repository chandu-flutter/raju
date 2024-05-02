import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/pages/chapters.dart';

import 'bible_helper.dart';

class Books extends StatefulWidget {
  final Map data;

  const Books(this.data, {super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  BibleHelper helper = BibleHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('బైబిల్'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: widget.data['Book'].length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      helper.getBookByIndex(index),
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Chapters(widget.data['Book'][index]['Chapter'])),
                    );
                  },
                );
              })),
    );
  }
}
