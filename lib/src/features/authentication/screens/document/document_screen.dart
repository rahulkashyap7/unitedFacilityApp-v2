import 'package:flutter/material.dart';
import 'package:united_app/src/features/authentication/screens/document/widget/document_tile.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
      ),
      body: ListView(
        children: const <Widget>[
          UflDocumentTile(title: 'Aadhar Card.pdf',),
          UflDocumentTile(title: 'Pan Card.pdf'),
          UflDocumentTile(title: 'Address Proof.pdf'),
          UflDocumentTile(title: 'Driving Licence.pdf'),
          UflDocumentTile(title: 'Birth Certificate.pdf'),
          UflDocumentTile(title: 'Education Certificate.pdf'),
        ],
      ),
    );
  }
}


