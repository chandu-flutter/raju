import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SatyaDarsanamTelugu extends StatefulWidget {
  const SatyaDarsanamTelugu({super.key});

  @override
  State<SatyaDarsanamTelugu> createState() => _SatyaDarsanamTeluguState();
}

class _SatyaDarsanamTeluguState extends State<SatyaDarsanamTelugu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('Satya Darsanam'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Share.share(
                    'https://thandrisannidhiministries.org/wp-content/uploads/2024/03/Satya-Darsanam-Book-telugu-1.pdf');
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      body: SafeArea(
        child: SfPdfViewer.asset("images/satya_telugu.pdf"),
      ),
    );
  }
}
