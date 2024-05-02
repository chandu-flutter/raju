import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:thandri_sannidhi/Bible/bible_index.dart';
import 'package:thandri_sannidhi/Translations/language_translation.dart';
import 'package:thandri_sannidhi/others/constants.dart';
import 'package:thandri_sannidhi/pages/contact.dart';
import 'package:thandri_sannidhi/pages/quiz.dart';
import 'package:thandri_sannidhi/pages/satya_darsanam_index.dart';
import 'package:thandri_sannidhi/prayer/prayer_request.dart';
import 'package:thandri_sannidhi/song_lyrics/songbook.dart';
import 'package:thandri_sannidhi/testimony/testimony.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'live.dart';
import '../prayer/prayer_victories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;
  GetStorage getStorage = GetStorage();
  @override
  void initState() {
    OneSignal.User.addTagWithKey("test2", "val2");
    WakelockPlus.enable();
    super.initState();
    imageUrl = '';
    getImageUrl();

    super.initState();
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('promise.jpg');

    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: Text('Thandri Sannidhi'.tr),
        actions: [
          DropdownButton<String>(
            value: getLanguageTitle(getStorage.read('activeLocal')),
            style: const TextStyle(color: Colors.white),
            dropdownColor: const Color.fromARGB(255, 54, 1, 63),
            borderRadius: BorderRadius.circular(5),
            items: <String>['EN', 'TEL'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (value) {
              LanguageTranslate().setLanguage(
                  getStorage.read('activeLocal') == 'en' ? 'te' : 'en');
            },
          ),
          InkWell(
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.thandri.thandri_sannidhi&pcampaignid=web_share');
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 26.0, right: 8.0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Card(
                    color: Colors.white,
                    elevation: 14,
                    child: imageUrl.isNotEmpty
                        ? Image(
                            image: NetworkImage(imageUrl, scale: 1.0),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const SizedBox(
                                  height: 200,
                                  width: 340,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        Color.fromARGB(255, 54, 1, 63),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            height: 200,
                            width: 340,
                          )
                        : const SizedBox(
                            height: 200,
                            width: 340,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Color.fromARGB(255, 54, 1, 63),
                                ),
                              ),
                            ),
                          )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SongBookScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.auto_stories,
                    label1: 'song'.tr,
                    label2: 'book'.tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SatyaDarsanamIndex();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.description,
                    label1: "satya".tr,
                    label2: "darsanam".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PrayerVictories();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.task_alt,
                    label1: "prayer".tr,
                    label2: "victories".tr,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Quiz();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.quiz,
                    label1: "",
                    label2: "Quiz".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // String url =
                    //     "https://www.youtube.com/playlist?list=PLDb1p7boCQFEwNpMHaiBP_Sxak1jJUtpS";
                    // launchUrl(url as Uri, mode: LaunchMode.externalApplication);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const YoutubeLive();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.live_tv,
                    label1: "",
                    label2: "live".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Books(helper.bibleData)),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BibleIndex();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: MdiIcons.bookCross,
                    label1: "holy".tr,
                    label2: "bible".tr,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TestimonyScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.accessibility_new,
                    label1: "",
                    label2: "testimony".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PrayerRequestScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    //icon: Icons.church,
                    icon: MdiIcons.handsPray,
                    label1: "prayer".tr,
                    label2: "request".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ContactScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.email,
                    label1: "",
                    label2: "contact".tr,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}

class Linked extends StatelessWidget {
  IconData icon;
  String label1;
  String label2;
  Linked({
    super.key,
    required this.icon,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Icon(
            icon,
            size: 40,
            color: const Color.fromARGB(255, 54, 1, 63),
          ),
          Text(
            label2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
