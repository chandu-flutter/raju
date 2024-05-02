import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:thandri_sannidhi/mp3_songs/mp3_song_details.dart';
import 'package:thandri_sannidhi/others/constants.dart';
import 'showdetails.dart';

class SearchSong extends StatefulWidget {
  const SearchSong({super.key});

  @override
  State<SearchSong> createState() => _SearchSongState();
}

class _SearchSongState extends State<SearchSong> {
  Constants constants = Constants();
  final TextEditingController searchField = TextEditingController();
  List<int> result = [];

  @override
  void initState() {
    result = [for (int i = 0; i < constants.englishTitles.length; i++) i];
    super.initState();
  }

  void getTelugu(String value) {
    List<String> telTitles = constants.teluguTitles;
    for (int i = 0; i < telTitles.length; i++) {
      if (telTitles[i].contains(value) && !result.contains(i)) {
        result.add(i);
      }
    }
  }

  void getEnglish(String value) {
    List<String> engTitles = constants.englishTitles;
    for (int i = 0; i < engTitles.length; i++) {
      if (engTitles[i].contains(RegExp(value, caseSensitive: false)) &&
          !result.contains(i)) {
        result.add(i);
      }
    }
  }

  void checkNumber(String value) {
    num? number = num.tryParse(value);
    if (number != null && number <= constants.teluguTitles.length) {
      result.clear();
      result.add(number.toInt() - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: TextField(
                      autofocus: true,
                      controller: searchField,
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              bottom: 11, top: 11, right: 12),
                          hintText: "searchHint".tr),
                      onChanged: (val) {
                        result.clear();
                        getTelugu(val);
                        getEnglish(val);
                        checkNumber(val);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: result.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Text(constants.teluguTitles[result[index]],
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text(constants.englishTitles[result[index]]),
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 54, 1, 63),
                          child: Text(
                            (result[index] + 1).toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 54, 1, 63),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mo3SongShowDetails(
                                        index: result[index])));
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowDetails(index: result[index])));
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
