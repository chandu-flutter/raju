import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Tithe extends StatefulWidget {
  const Tithe({super.key});

  @override
  State<Tithe> createState() => _TitheState();
}

class _TitheState extends State<Tithe> {
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
        title: const Text('Donate Now'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "images/scan_pay.jpg",
              width: 230,
            ),
            const Divider(
              color: Color.fromARGB(255, 54, 1, 63),
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "BANK ACCOUNT DETAILS:\nTHANDRI SANNIDHI\nBANK OF BORODA\nCURRENT ACCOUNT NUMBER: 75380200000156\nIFSC CODE: BARBOVJCHPE",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color.fromARGB(255, 54, 1, 63),
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            const Donate(),
            Lottie.asset("animations/payment.json", width: 300),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri donation = Uri.parse(
        'https://portal.getepay.in:8443/getepayPortal/paymentForm/TSMFORM');
    return InkWell(
      onTap: () {
        launchUrl(donation, mode: LaunchMode.externalApplication);
      },
      child: Container(
        height: 50,
        width: 210,
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Color.fromARGB(255, 54, 1, 63),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Donate Online",
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 1, 63),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
