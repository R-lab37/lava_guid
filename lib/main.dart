import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPDFScreen(),
    );
  }
}

class MyPDFScreen extends StatefulWidget {
  @override
  _MyPDFScreenState createState() => _MyPDFScreenState();
}

class _MyPDFScreenState extends State<MyPDFScreen> {
  late PDFDocument document;
  bool isDocumentLoaded = false;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  Future<void> loadDocument() async {
    final pdfAsset = await PDFDocument.fromAsset('assets/user_manual.pdf');
    setState(() {
      document = pdfAsset;
      isDocumentLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lava Guide'),
      ),
      body: isDocumentLoaded
          ? PDFViewer(document: document)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
