import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  bool isLoading = true;
  String url =
      "https://ibm-wind-api.herokuapp.com/datawithtype?file=simple_demo&type=pdf";
  PDFDocument _doc;
  @override
  void initState() {
    super.initState();
    _initPDF();
  }

  _initPDF() async {
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc = doc;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PDFViewer(
              document: _doc,
            ),
    );
  }
}
