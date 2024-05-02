import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PolicePermission extends StatefulWidget {
  const PolicePermission({super.key});

  @override
  State<PolicePermission> createState() => _PolicePermissionState();
}

class _PolicePermissionState extends State<PolicePermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('Polica Permission'),
        centerTitle: true,
        // actions: [
        //   InkWell(
        //       onTap: () {
        //         Share.share(
        //             'https://thandrisannidhiministries.org/wp-content/uploads/2024/03/English.pdf');
        //       },
        //       child: const Padding(
        //         padding: EdgeInsets.only(right: 8.0),
        //         child: Icon(Icons.share),
        //       )),
        // ],
      ),
      body: SafeArea(
        child: SfPdfViewer.asset("images/satya_english.pdf"),
      ),
    );
  }
}
