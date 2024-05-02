import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:thandri_sannidhi/pages/about.dart';
import 'package:thandri_sannidhi/pages/meeting_ground.dart';
import 'package:thandri_sannidhi/pages/online_magazine.dart';
import 'package:thandri_sannidhi/pages/our_rights.dart';
import 'package:thandri_sannidhi/pages/policy.dart';
import 'package:thandri_sannidhi/pages/time.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri youtube =
        Uri.parse('https://www.youtube.com/channel/UCRpDtgRvuhTFShCe5IWN-og');
    final Uri instagram =
        Uri.parse('https://www.instagram.com/_thandri_sannidhi_ministries/');
    final Uri facebook = Uri.parse(
        'https://www.facebook.com/THANDRISANNIDHIMINISTRIES?mibextid=ZbWKwL');
    final Uri twitter = Uri.parse('https://twitter.com/ThandriSannidh1');
    return Drawer(
//      backgroundColor: const Color.fromARGB(255, 54, 1, 63),
      backgroundColor: const Color.fromARGB(255, 1, 41, 63),
      elevation: 0,
      child: ListView(
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 1, 41, 63),
          //   ),
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Image(
          //           image: AssetImage(
          //             'images/logo.png',
          //           ),
          //           width: 200,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.church,
          //     size: 20,
          //     color: Color.fromARGB(255, 255, 255, 255),
          //   ),
          //   title: const Text(
          //     "About Us ",
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return AboutScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.public,
          //     size: 20,
          //     color: Color.fromARGB(255, 255, 255, 255),
          //   ),
          //   title: const Text(
          //     "Website",
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const Website();
          //         },
          //       ),
          //     );
          //   },
          // ),
          Image.asset(
            'images/logo.png',
            width: 90,
            height: 90,
          ),
          const Divider(
            color: Colors.white,
          ),

          ListTile(
            leading: const Icon(
              Icons.church,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "About".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.nature_people,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Meeting Ground".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MeetingGround();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_book,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Online Magazine".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OnlineMagazineScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.watch,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Service Timings".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ServiceTime();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Privacy Policy".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PolicyScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.local_police,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              "Our Rights".tr,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PolicePermission();
                  },
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 241, 208, 0),
                  ),
                  width: 170,
                  height: 30,
                  child: const Center(
                    child: Text(
                      "Follow Us On",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(youtube,
                            mode: LaunchMode.externalApplication);
                      },
                      child: Image.asset(
                        'images/youtube.png',
                        width: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(instagram,
                            mode: LaunchMode.externalApplication);
                      },
                      child: Image.asset(
                        'images/insta.png',
                        width: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(facebook,
                            mode: LaunchMode.externalApplication);
                      },
                      child: Image.asset(
                        'images/facebook.png',
                        width: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(twitter,
                            mode: LaunchMode.externalApplication);
                      },
                      child: Image.asset(
                        'images/twitter.png',
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Lottie.asset("animations/sw_le.json"),
        ],
      ),
    );
  }
}
