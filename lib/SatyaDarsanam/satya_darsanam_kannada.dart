import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SatyaDarsanamKannada extends StatefulWidget {
  const SatyaDarsanamKannada({super.key});

  @override
  State<SatyaDarsanamKannada> createState() => _SatyaDarsanamKannadaState();
}

class _SatyaDarsanamKannadaState extends State<SatyaDarsanamKannada> {
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
                    'https://thandrisannidhiministries.org/wp-content/uploads/2024/03/Kannada.pdf');
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      body: SafeArea(
        child: SfPdfViewer.asset("images/satya_kannada.pdf"),
      ),
    );
  }
}
